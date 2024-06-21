import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class PopularBookWidget extends StatelessWidget {
  final Book book;

  const PopularBookWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouteEnum currentPath = AppRouteEnum.bookDetails;
        String routePath = currentPath.name;
        context.push("/$routePath/${book.id}");
      },
      child: Row(
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
                        label: book.rating.toString(),
                        color: AppColors.black,
                        fontSize: AppFontSize.small,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const TextApp(
                      label: 'Avaliação',
                      color: AppColors.gray,
                      fontSize: AppFontSize.small,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
