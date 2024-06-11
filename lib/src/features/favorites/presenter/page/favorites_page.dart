import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/favorites/presenter/components/favorite_books_section.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<bool> isFavoriteList = List<bool>.filled(10, true);
  List<bool> onCartList = List<bool>.filled(10, false);

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  void addCart(int index) {
    setState(() {
      onCartList[index] = !onCartList[index];
    });
  }

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
              const TextApp(
                label: 'Seus favoritos',
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              const SizedBox(height: 36),
              FavoriteBooksSection(
                addCartAction: addCart,
                toggleFavoriteAction: toggleFavorite,
                isFavoriteList: isFavoriteList,
                onCartList: onCartList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
