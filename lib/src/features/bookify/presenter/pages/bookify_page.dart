import 'package:flutter/material.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/models/settings_book.dart';
import 'package:bookify/src/core/models/book_loan.dart';
import 'package:bookify/src/core/services/book_service.dart';
import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/bookify/presenter/components/bookify_list.dart';
import 'package:bookify/src/features/bookify/presenter/widgets/bookify_app_bar.dart';

class BookifyPage extends StatefulWidget {
  const BookifyPage({super.key});

  @override
  _BookifyPageState createState() => _BookifyPageState();
}

class _BookifyPageState extends State<BookifyPage> {
  List<SettingsBooks> settingsBooks = [];
  List<Book> allBooks = [];
  final BookService _bookService = BookService();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    final userId = AuthRepository.idUser!;

    try {
      final fetchedSettingsBooks = await _bookService.fetchBooksUser(userId);
      final fetchedAllBooks = await _bookService.fetchBooks();
      setState(() {
        settingsBooks = fetchedSettingsBooks;
        allBooks = fetchedAllBooks;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao buscar livros: $e'),
        ),
      );
    }
  }

  Book _findBookById(String id) {
    return allBooks.firstWhere((book) => book.id == id);
  }

  Future<void> _toggleCheck(int index) async {
    final userId = AuthRepository.idUser!;

    final selectedCount = settingsBooks.where((book) => book.selected!).length;

    if (selectedCount < 2 || settingsBooks[index].selected!) {
      setState(() {
        settingsBooks[index] = settingsBooks[index]
            .copyWith(selected: !settingsBooks[index].selected!);
      });

      try {
        await _bookService.updateBooks(userId, [settingsBooks[index]]);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao atualizar livros: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você só pode selecionar até 2 livros.'),
        ),
      );
    }
  }

  Future<void> _deleteItem(int index) async {
    final userId = AuthRepository.idUser!;

    setState(() {
      settingsBooks[index] =
          settingsBooks[index].copyWith(onCart: !settingsBooks[index].onCart);
    });

    try {
      await _bookService.updateBooks(userId, [settingsBooks[index]]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar livros: $e'),
        ),
      );
    }
  }

  Future<void> _favoriteItem(int index) async {
    final userId = AuthRepository.idUser!;

    setState(() {
      settingsBooks[index] = settingsBooks[index]
          .copyWith(favorite: !settingsBooks[index].favorite);
    });

    try {
      await _bookService.updateBooks(userId, [settingsBooks[index]]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar livros: $e'),
        ),
      );
    }
  }

  Future<void> _loanSelectedBooks() async {
    setState(() {
      isLoading = true;
    });

    final userId = AuthRepository.idUser!;
    final selectedBooks = settingsBooks.where((book) => book.selected).toList();

    if (selectedBooks.isEmpty) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecione pelo menos um livro para empréstimo.'),
        ),
      );
      return;
    }

    final bookLoans = selectedBooks.map((settingsBook) {
      return BookLoan(
        book: settingsBooks
            .firstWhere((book) => book.id == settingsBook.id)
            .book!,
        userId: userId,
        bookId: settingsBook.id,
        loanDate: DateTime.now(),
        returnDate: DateTime.now().add(const Duration(days: 7)),
      );
    }).toList();

    try {
      for (var loan in bookLoans) {
        await _bookService.createBookLoan(loan);
      }

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Empréstimos criados com sucesso!'),
        ),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao criar empréstimos: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookifyAppBar(
          selectedCount: settingsBooks.where((book) => book.selected).length,
          refresh: _fetchBooks,
          toBookLoan: _loanSelectedBooks,
        ),
        BookifyList(
          books: settingsBooks,
          findBookById: _findBookById,
          toggleCheck: _toggleCheck,
          deleteItem: _deleteItem,
          favoriteItem: _favoriteItem,
        ),
      ],
    );
  }
}
