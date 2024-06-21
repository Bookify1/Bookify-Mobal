import 'package:bookify/src/core/models/settings_book.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/features/bookify/presenter/widgets/bookify_card.dart';

class BookifyList extends StatelessWidget {
  final List<SettingsBooks> books;
  final Function(String) findBookById;
  final Function(int) toggleCheck;
  final Function(int) deleteItem;
  final Function(int) favoriteItem;

  const BookifyList({
    super.key,
    required this.findBookById,
    required this.books,
    required this.toggleCheck,
    required this.deleteItem,
    required this.favoriteItem,
  });

  @override
  Widget build(BuildContext context) {
    final List<SettingsBooks> booksInCart =
        books.where((book) => book.onCart!).toList();

    return SliverPadding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 120),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final book = findBookById(booksInCart[index].id);
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  deleteItem(index);
                }
              },
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: (index < 2 || booksInCart.length - 1 > index) ? 8 : 0,
                ),
                child: BookifyCard(
                  settingsBook: booksInCart[index],
                  book: book,
                  removeItem: () => deleteItem(index),
                  onTap: () => toggleCheck(index),
                  onFavorite: () => favoriteItem(index),
                  select: booksInCart[index].selected!,
                ),
              ),
            );
          },
          childCount: booksInCart.length,
        ),
      ),
    );
  }
}
