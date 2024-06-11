import 'package:bookify/src/features/favorites/presenter/widgets/favorite_book_widget.dart';
import 'package:flutter/material.dart';

class FavoriteBooksSection extends StatelessWidget {
  final Function(int) addCartAction;
  final Function(int) toggleFavoriteAction;
  final List<bool> isFavoriteList;
  final List<bool> onCartList;

  const FavoriteBooksSection({
    super.key,
    required this.addCartAction,
    required this.toggleFavoriteAction,
    required this.isFavoriteList,
    required this.onCartList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: isFavoriteList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 26),
      itemBuilder: (context, index) {
        return favoriteBookWidget(
          isFavorite: isFavoriteList[index],
          onCart: onCartList[index],
          addCart: () => addCartAction(index),
          toggleFavorite: () => toggleFavoriteAction(index),
        );
      },
    );
  }
}
