import 'package:bookify/src/core/components/button_submit.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/signup/presenter/components/build_progress_indicator.dart';
import 'package:bookify/src/features/signup/presenter/pages/account_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/verification_account_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/details_account_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/location_info_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final Map<String, Widget> _dynamicWidgets;

  int _step = 1;
  int _remainingSteps = 4;

  @override
  void initState() {
    super.initState();
    _dynamicWidgets = {
      'Informações': DetailsAccountPage(),
      'Localização': LocationPage(),
      'Conta': AccountPage(),
      'Verificação': VerificationCodePage(),
      'Termos': TermsPage(),
      //'Aceite os termos': YourCustomWidget3(),
      //'Confirme seus dados': YourCustomWidget3(),
    };
  }

  void nextStep() {
    if (_step < _dynamicWidgets.length) {
      setState(() {
        _step++;
        _remainingSteps--;
      });
    }
  }

  void backStep() {
    if (_step > 1) {
      setState(() {
        _step--;
        _remainingSteps++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: backStep,
                          ),
                        ),
                        Center(
                          child: TextApp(
                            label: _dynamicWidgets.keys.elementAt(_step - 1),
                            color: AppColors.black,
                            fontSize: AppFontSize.xxxLarge,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextApp(
                      label: 'Step $_step of ${_remainingSteps + _step}',
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 8),
                    BuildProgressIndicator(
                      step: _step,
                      remainingSteps: _remainingSteps,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: .6.sh - 28,
                child: _dynamicWidgets.values.elementAt(_step - 1),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ButtonSubmitForm(
                      label: 'Continuar',
                      function: nextStep,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextApp(
                        label: 'Possui uma conta?',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                        onPressed: () {
                          AppRouteEnum currentPath = AppRouteEnum.signin;
                          String routePath = currentPath.name;
                          Navigator.pushReplacementNamed(context, routePath);
                        },
                        child: const TextApp(
                          label: "Entre",
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
