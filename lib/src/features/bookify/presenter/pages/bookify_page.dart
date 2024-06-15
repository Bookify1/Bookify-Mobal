import 'package:bookify/src/features/bookify/presenter/components/bookify_list.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/features/bookify/presenter/widgets/bookify_app_bar.dart';

class BookifyPage extends StatefulWidget {
  const BookifyPage({super.key});

  @override
  _BookifyPageState createState() => _BookifyPageState();
}

class _BookifyPageState extends State<BookifyPage> {
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> isFavoritedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int get selectedCount => isCheckedList.where((isChecked) => isChecked).length;

  void _toggleCheck(int index) {
    if (isCheckedList[index]) {
      setState(() {
        isCheckedList[index] = false;
      });
    } else {
      if (selectedCount < 2) {
        setState(() {
          isCheckedList[index] = true;
        });
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Você só pode selecionar até 2 livros.'),
          ),
        );
      }
    }
  }

  void _deleteItem(int index) {
    setState(() {
      isCheckedList.removeAt(index);
      isFavoritedList.removeAt(index);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você acaba de remover um livro da sua lista'),
        ),
      );
    });
  }

  void _favoriteItem(int index) {
    setState(() {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      isFavoritedList[index] = !isFavoritedList[index];
      if (isFavoritedList[index] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Você acaba de favoritar um livro da sua lista'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Você acaba de desfavoritar um livro da sua lista'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookifyAppBar(selectedCount: selectedCount),
        BookifyList(
          isCheckedList: isCheckedList,
          isFavoritedList: isFavoritedList,
          toggleCheck: _toggleCheck,
          deleteItem: _deleteItem,
          favoriteItem: _favoriteItem,
        ),
      ],
    );
  }
}
