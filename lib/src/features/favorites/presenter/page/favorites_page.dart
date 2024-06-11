import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/favorites/presenter/components/favorite_books_section.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
          minWidth: 1.sw,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 28,
            right: 28,
            top: 100,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextApp(
                label: 'Seus favoritos',
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              SizedBox(height: 36),
              FavoriteBooksSection()
            ],
          ),
        ),
      ),
    );
  }
}