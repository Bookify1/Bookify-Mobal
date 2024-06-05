import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class DetailsAccountPage extends StatelessWidget {
  const DetailsAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          label: 'Detalhes da Conta',
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        SizedBox(height: 10),
        TextApp(
          label: 'Por favor, preencha os campos abaixo com suas informações.',
          color: AppColors.gray,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Nome',
          hintText: 'John',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Sobrenome',
          hintText: 'Doe',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Telefone',
          hintText: '(11) 00000-0000',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'RG',
          hintText: '00.000.000-0',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'CPF',
          hintText: '000.000.000-00',
        ),
      ],
    );
  }
}
