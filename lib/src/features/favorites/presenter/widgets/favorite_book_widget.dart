import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/favorites/presenter/widgets/bookify_button.dart';
import 'package:flutter/material.dart';

Widget favoriteBookWidget({
  required bool isFavorite,
  required bool onCart,
  required VoidCallback addCart,
  required VoidCallback toggleFavorite,
}) {
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
          'assets/images/mock.jpg',
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  label: 'Yves Saint Laurent',
                  fontSize: AppFontSize.large,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                SizedBox(height: 4),
                TextApp(
                  label: 'Suzy Menkes ',
                  color: AppColors.gray,
                ),
              ],
            ),
            const SizedBox(height: 22),
            bookifyButton(),
          ],
        ),
      ),
      SizedBox(
        height: 105,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: isFavorite
                  ? const Icon(
                      Icons.bookmark,
                      color: AppColors.yellow,
                    )
                  : const Icon(Icons.bookmark_border),
              onPressed: toggleFavorite,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: onCart ? AppColors.red : AppColors.green,
                borderRadius: BorderRadius.circular(999),
              ),
              child: IconButton(
                icon: Icon(
                  size: 13,
                  color: AppColors.white,
                  onCart
                      ? Icons.remove_shopping_cart_outlined
                      : Icons.add_shopping_cart_outlined,
                ),
                onPressed: addCart,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
