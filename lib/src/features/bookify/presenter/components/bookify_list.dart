import 'package:flutter/material.dart';
import 'package:bookify/src/features/bookify/presenter/widgets/bookify_card.dart';

class BookifyList extends StatelessWidget {
  final List<bool> isCheckedList;
  final List<bool> isFavoritedList;
  final Function(int) toggleCheck;
  final Function(int) deleteItem;
  final Function(int) favoriteItem;

  const BookifyList({
    super.key,
    required this.isCheckedList,
    required this.isFavoritedList,
    required this.toggleCheck,
    required this.deleteItem,
    required this.favoriteItem,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 20, bottom: 120),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  bottom:
                      (index < 2 || isCheckedList.length - 1 > index) ? 8 : 0,
                ),
                child: BookifyCard(
                  title: 'Yves Saint Laurent',
                  author: 'Suzy Menkes',
                  imageUrl: 'assets/images/mock.jpg',
                  isChecked: isCheckedList[index],
                  isFavorited: isFavoritedList[index],
                  removeItem: () => deleteItem(index),
                  onTap: () => toggleCheck(index),
                  onFavorite: () => favoriteItem(index),
                ),
              ),
            );
          },
          childCount: isCheckedList.length,
        ),
      ),
    );
  }
}
