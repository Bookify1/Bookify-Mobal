import 'package:bookify/src/core/components/button_submit.dart';
import 'package:bookify/src/core/components/text_field_form.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  Widget textForm({
    required String label,
    required Color color,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = AppFontSize.medium,
  }) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

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
              textForm(
                label: 'Cads! 👋',
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
                        value: true,
                        onChanged: (bool? value) {
                          // Adicionar funcionalidade ao checkbox
                        },
                      ),
                      textForm(
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
                    child: textForm(
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
                  // Adicionar funcionalidade para o botão de login
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textForm(
                    label: 'Não possui uma conta?',
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  TextButton(
                    onPressed: () {
                      // Adicionar funcionalidade para o botão de cadastro
                    },
                    child: textForm(
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
