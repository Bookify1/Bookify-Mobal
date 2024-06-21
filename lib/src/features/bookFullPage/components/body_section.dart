import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  final Book book;

  BodySection({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 200,
          width: 140,
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
        const SizedBox(height: 20),
        TextApp(
          label: book.title,
          fontSize: AppFontSize.xxxLarge,
          fontWeight: FontWeight.bold,
          alignment: TextAlign.center,
          color: AppColors.black,
        ),
        const SizedBox(height: 8),
        TextApp(
          label: book.author,
          fontSize: AppFontSize.large,
          color: Colors.grey,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) {
              return Icon(Icons.star_rounded,
                  color: index < book.rating.floor()
                      ? AppColors.yellow
                      : AppColors.lightGrey,
                  size: 24);
            },
          ),
        ),
        const SizedBox(height: 13),
        TextApp(
          label: book.description,
          color: AppColors.black,
        ),
      ],
    );
  }
}
