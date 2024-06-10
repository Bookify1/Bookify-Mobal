import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';

Widget FavoriteBookWidget({bool? isFavorite}) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  label: 'Yves Saint Laurent',
                  fontSize: AppFontSize.large,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                const SizedBox(height: 4),
                TextApp(
                  label: 'Suzy Menkes ',
                  color: AppColors.gray,
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextApp(
                    label: '4.5',
                    color: AppColors.black,
                    fontSize: AppFontSize.small,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                TextApp(
                  label: 'Avaliação',
                  color: AppColors.gray,
                  fontSize: AppFontSize.small,
                ),
              ],
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: isFavorite!
                ? Icon(
                    Icons.bookmark,
                    color: AppColors.yellow,
                  )
                : Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
    ],
  );
}
