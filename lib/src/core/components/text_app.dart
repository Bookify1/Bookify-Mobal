import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextApp extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign alignment;
  final TextOverflow overflow;
  const TextApp({
    super.key,
    required this.label,
    required this.color,
    this.fontWeight = FontWeight.w400,
    this.fontSize = AppFontSize.medium,
    this.alignment = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: alignment,
      overflow: overflow,
      style: GoogleFonts.poppins(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: 0,
        fontSize: fontSize,
      ),
    );
  }
}
