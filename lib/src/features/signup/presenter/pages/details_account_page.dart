import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:flutter/material.dart';

class DetailsAccountPage extends StatelessWidget {
  const DetailsAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFieldForm(
          labelText: 'Nome',
          hintText: 'John',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Sobrenome',
          hintText: 'Doe',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Telefone',
          hintText: '(11) 00000-0000',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'RG',
          hintText: '00.000.000-0',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'CPF',
          hintText: '000.000.000-00',
        ),
      ],
    );
  }
}
