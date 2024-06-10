import 'package:bookify/src/features/favorites/presenter/widgets/favorite_book_widget.dart';
import 'package:flutter/material.dart';

class FavoriteBooksSection extends StatelessWidget {
  const FavoriteBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 26),
      itemBuilder: (context, index) {
        return FavoriteBookWidget(isFavorite: true);
      },
    );
  }
}
