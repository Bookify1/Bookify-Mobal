import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

class PopularBookWidget extends StatelessWidget {
  final String title;
  final String author;
  final double rating;
  final String imageUrl;

  const PopularBookWidget({
    super.key,
    required this.title,
    required this.author,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72,
          height: 105,
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
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    label: title,
                    fontSize: AppFontSize.large,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 4),
                  TextApp(
                    label: author,
                    color: AppColors.gray,
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star_rounded,
                    color: index < rating.round()
                        ? AppColors.yellow
                        : AppColors.lightWhite,
                    size: 20,
                  );
                }),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
      ],
    );
  }
}
