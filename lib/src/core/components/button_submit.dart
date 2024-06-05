// ignore_for_file: prefer_const_constructors

import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSubmitForm extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final Color? color; // Adicionando o parâmetro de cor
  const ButtonSubmitForm({
    Key? key,
    required this.label,
    required this.function,
    this.color, // Configurando cor como opcional
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(
          Size(double.maxFinite, 50),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            // Lógica para definir a cor do botão com base no parâmetro
            if (color != null) {
              return color!;
            }
            return AppColors.blue; // Cor padrão se não for especificada
          },
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: function,
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: AppFontSize.large,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
}
