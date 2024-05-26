import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final int activeIndex;
  final List<String> urlImages;
  final Function refresh;

  const ContinueButton({
    super.key,
    required this.activeIndex,
    required this.urlImages,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => refresh()(),
      backgroundColor: AppColors.darkGreen,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.arrow_forward_outlined,
        color: AppColors.white,
      ),
    );
  }
}
