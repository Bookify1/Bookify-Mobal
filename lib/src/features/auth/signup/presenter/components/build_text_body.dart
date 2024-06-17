import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextSpan buildBody(String text) {
  return TextSpan(
    text: '$text\n\n',
    style: GoogleFonts.poppins(
      color: AppColors.lightGray,
      fontSize: AppFontSize.medium,
    ),
  );
}
