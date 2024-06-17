import 'package:bookify/src/core/components/button_submit.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextApp(
                label: 'Bem vindo! 👋',
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.xxxLarge,
              ),
              const SizedBox(height: 32),
              const TextFieldForm(
                labelText: 'Email',
                hintText: 'exemplo@gmail.com',
              ),
              const SizedBox(height: 16),
              TextFieldForm(
                labelText: 'Senha',
                hintText: 'Sua senha',
                obscureText: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    // Adicionar funcionalidade para alternar a visibilidade da senha
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      const TextApp(
                        label: 'Lembrar de mim',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Adicionar funcionalidade para "Esqueceu sua senha?"
                    },
                    child: const TextApp(
                      label: 'Esqueceu sua senha?',
                      color: AppColors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ButtonSubmitForm(
                label: 'Entre',
                function: () {
                  AppRouteEnum currentPath = AppRouteEnum.home;
                  String routePath = currentPath.name;
                  context.pushReplacement(routePath);
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextApp(
                    label: 'Não possui uma conta?',
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {
                      AppRouteEnum currentPath = AppRouteEnum.signup;
                      String routePath = currentPath.name;
                      context.pushReplacement(routePath);
                    },
                    child: const TextApp(
                      label: "Cadastre-se",
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
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
