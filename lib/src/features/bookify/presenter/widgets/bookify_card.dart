import 'package:bookify/src/core/models/settings_book.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';

class BookifyCard extends StatelessWidget {
  final SettingsBooks settingsBook;
  final Book book;
  final bool select;
  final VoidCallback onTap;
  final VoidCallback onFavorite;
  final VoidCallback removeItem;

  const BookifyCard({
    super.key,
    required this.settingsBook,
    required this.book,
    required this.onTap,
    required this.onFavorite,
    required this.removeItem,
    required this.select,
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
            imageUrl: book.coverImage,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    label: book.title,
                    fontSize: AppFontSize.large,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 4),
                  TextApp(
                    label: book.author,
                    color: AppColors.gray,
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 8),
                      side: const BorderSide(color: AppColors.black, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: removeItem,
                    child: const TextApp(
                      label: 'Remover',
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      settingsBook.favorite
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: AppColors.yellow,
                    ),
                    onPressed: onFavorite,
                  )
                ],
              ),
            ],
          ),
        ),
        Checkbox(
          value: select,
          onChanged: (bool? value) {
            onTap();
          },
        ),
      ],
    );
  }
}
