import 'package:bookify/src/core/components/button_submit.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/core/utils/constant/validators.dart';
import 'package:bookify/src/features/auth/signin/presenter/state/auth_sigin_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final authState = context.read<AuthSiginState>();
      await authState.signIn(_emailController.text, _passwordController.text);
      if (authState.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(authState.errorMessage ?? 'Erro desconhecido')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Parabéns, login realizado com sucesso!')),
        );
        AppRouteEnum currentPath = AppRouteEnum.home;
        String routePath = currentPath.name;
        context.pushReplacement(routePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthSiginState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextApp(
                label: 'Entrar',
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              const SizedBox(height: 10),
              const TextApp(
                label: 'Por favor, preencha os campos abaixo para entrar.',
                color: AppColors.gray,
              ),
              const SizedBox(height: 15),
              TextFieldForm(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'exemplo@gmail.com',
                validator: emailValidator,
              ),
              const SizedBox(height: 15),
              TextFieldForm(
                controller: _passwordController,
                labelText: 'Senha',
                hintText: 'Sua senha',
                obscureText: true,
                validator: passwordValidator,
              ),
              const SizedBox(height: 15),
              if (authState.isLoading) const CircularProgressIndicator(),
              if (!authState.isLoading)
                ButtonSubmitForm(
                  label: 'Entrar',
                  function: () => _signIn(context),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
