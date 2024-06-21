import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/favorites/presenter/widgets/bookify_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavoriteBookWidget extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final bool isFavorite;
  final bool onCart;
  final VoidCallback addCart;
  final VoidCallback toggleFavorite;

  const FavoriteBookWidget({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.isFavorite,
    required this.onCart,
    required this.addCart,
    required this.toggleFavorite,
    super.key,
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/images/book_placeholder.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
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
              const SizedBox(height: 13),
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
}
