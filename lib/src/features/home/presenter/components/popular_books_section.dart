import 'package:flutter/material.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/home/presenter/components/popular_books_widget.dart';

class PopularBooksSection extends StatelessWidget {
  const PopularBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          label: 'Livros Populares',
          color: AppColors.black,
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 32),
        PopularBookWidget(
          title: 'Yves Saint Laurent',
          author: 'Suzy Menkes',
          rating: 4,
          imageUrl: 'assets/images/mock.jpg',
        ),
      ],
    );
  }
}
