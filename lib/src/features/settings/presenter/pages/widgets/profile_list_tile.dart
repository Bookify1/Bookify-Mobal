import 'package:flutter/material.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.lightBlack,
      ),
      title: TextApp(
        label: label,
        color: AppColors.lightBlack,
        fontWeight: FontWeight.w600,
      ),
      onTap: onTap,
    );
  }
}
