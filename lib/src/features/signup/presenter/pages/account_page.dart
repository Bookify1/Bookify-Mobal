import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          label: 'Criar Conta',
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        SizedBox(height: 10),
        TextApp(
          label: 'Por favor, preencha os campos abaixo para criar sua conta.',
          color: AppColors.gray,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Email',
          hintText: 'exemplo@gmail.com',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Senha',
          hintText: 'Sua senha',
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: null,
          ),
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Confirme sua senha',
          hintText: 'Sua senha',
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: null,
          ),
        ),
      ],
    );
  }
}
