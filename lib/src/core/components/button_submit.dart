import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSubmitForm extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final bool isLoading;
  final Color? color;

  const ButtonSubmitForm({
    super.key,
    required this.label,
    required this.function,
    this.isLoading = false,
    this.color,
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
            if (color != null) {
              return color!;
            }
            return AppColors.blue;
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
      onPressed: isLoading ? null : function,
      child: isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            )
          : Text(
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
