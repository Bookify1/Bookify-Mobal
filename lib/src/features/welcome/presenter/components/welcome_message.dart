import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Explore",
            style: GoogleFonts.poppins(
              fontSize: AppFontSize.xxxLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Comece sua jornada literária conosco. Escolha como deseja acessar nossos serviços:",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: AppFontSize.medium,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
