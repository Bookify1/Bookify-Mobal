import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

Widget bookifyButton() {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    onPressed: () {},
    child: const TextApp(
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      label: 'Emprestar',
    ),
  );
}
