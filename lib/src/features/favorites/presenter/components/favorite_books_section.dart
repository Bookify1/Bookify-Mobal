import 'package:bookify/src/core/models/settings_book.dart';
import 'package:bookify/src/features/favorites/presenter/widgets/favorite_book_widget.dart';
import 'package:flutter/material.dart';

class FavoriteBooksSection extends StatelessWidget {
  final Function(int) addCartAction;
  final Function(int) toggleFavoriteAction;
  final List<SettingsBooks> settingsBooks;

  const FavoriteBooksSection({
    super.key,
    required this.addCartAction,
    required this.toggleFavoriteAction,
    required this.settingsBooks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: settingsBooks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final settingsBook = settingsBooks[index];
        return FavoriteBookWidget(
          title: settingsBook.book!.title,
          author: settingsBook.book!.author,
          imageUrl: settingsBook.book!.coverImage,
          isFavorite: settingsBook.favorite,
          onCart: settingsBook.onCart!,
          addCart: () => addCartAction(index),
          toggleFavorite: () => toggleFavoriteAction(index),
        );
      },
    );
  }
}
