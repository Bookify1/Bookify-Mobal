import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          label: 'Detalhes de Localização',
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        SizedBox(height: 10),
        TextApp(
          label:
              'Por favor, preencha os campos abaixo com suas informações de localização.',
          color: AppColors.gray,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'CEP',
          hintText: '000000-00',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Endereço',
          hintText: '000000-00',
          enabled: false,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Números',
          hintText: '',
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Estado',
          hintText: '',
          enabled: false,
        ),
        SizedBox(height: 15),
        TextFieldForm(
          labelText: 'Cidade',
          hintText: '',
          enabled: false,
        ),
      ],
    );
  }
}
