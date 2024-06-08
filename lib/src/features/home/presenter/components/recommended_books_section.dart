import 'package:flutter/material.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/home/presenter/components/recommended_book_widget.dart';

class RecommendedBooksSection extends StatelessWidget {
  const RecommendedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextApp(
          label: 'Livros Recomendados',
          color: AppColors.black,
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              RecommendedBookWidget(
                title: 'Fashionopolis',
                author: 'Dana Thomas',
                imageUrl: 'assets/images/mock.jpg',
              ),
              SizedBox(width: 24),
              RecommendedBookWidget(
                title: 'Chanel',
                author: 'Patrick Mauriès',
                imageUrl: 'assets/images/mock.jpg',
              ),
              SizedBox(width: 24),
              RecommendedBookWidget(
                title: 'Calligraphy',
                author: 'June & Lucy',
                imageUrl: 'assets/images/mock.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
