import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFieldForm(
          labelText: 'Email',
          hintText: 'exemplo@gmail.com',
        ),
        SizedBox(height: 16),
        TextFieldForm(
          labelText: 'Senha',
          hintText: 'Sua senha',
          obscureText: true,
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            onPressed: null,
          ),
        ),
        SizedBox(height: 16),
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
