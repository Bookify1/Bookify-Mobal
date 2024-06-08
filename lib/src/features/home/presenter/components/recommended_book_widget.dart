import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class RecommendedBookWidget extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  const RecommendedBookWidget({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextApp(
          label: title,
          fontSize: AppFontSize.large,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        TextApp(
          label: author,
          color: AppColors.gray,
        ),
      ],
    );
  }
}
