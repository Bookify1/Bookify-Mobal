import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendedBookWidget extends StatelessWidget {
  final Book book;

  const RecommendedBookWidget({
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
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 200,
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
            ),
            const SizedBox(height: 20),
            TextApp(
              label: book.title,
              fontSize: AppFontSize.large,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            TextApp(
              label: book.author,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}
