import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavigationBarItem(
    IconData icon, String label, double size) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Icon(
        icon,
        color: AppColors.gray.withOpacity(.7),
        size: size,
      ),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Icon(
        icon,
        color: AppColors.black,
        size: size,
      ),
    ),
    label: label,
  );
}
