import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final Widget? suffixIcon;

  const TextFieldForm({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: enabled ? AppColors.gray : Colors.white70,
          fontWeight: FontWeight.w400,
          fontSize: AppFontSize.large,
        ),
        filled: !enabled,
        fillColor: !enabled ? AppColors.gray : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.gray,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.yellow,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.gray,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
