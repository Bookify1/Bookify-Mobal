import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'CEP',
          hintText: '000000-00',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Endereço',
          hintText: '000000-00',
          enabled: false,
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Números',
          hintText: '',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Estado',
          hintText: '',
          enabled: false,
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Cidade',
          hintText: '',
          enabled: false,
        ),
      ],
    );
  }
}
