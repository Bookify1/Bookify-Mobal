import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/bookFullPage/components/body_section.dart';
import 'package:bookify/src/features/bookFullPage/components/button.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/models/settings_book.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/services/book_service.dart';
import 'package:go_router/go_router.dart';

class BookDetailsScreen extends StatefulWidget {
  final String bookId;
  const BookDetailsScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late Future<Book?> _bookFuture;
  late bool _isFavorite = false;
  String userId = AuthRepository.idUser!;

  @override
  void initState() {
    super.initState();
    _loadBookDetails();
  }

  Future<void> _loadBookDetails() async {
    try {
      _bookFuture = BookService().fetchBookById(widget.bookId);

      SettingsBooks? settingsBooks =
          await BookService().fetchSettingsBook(userId, widget.bookId);
      if (settingsBooks != null) {
        setState(() {
          _isFavorite = settingsBooks.favorite;
        });
      }
    } catch (e) {
      // Lidar com erros
      print('Erro ao carregar detalhes do livro: $e');
    }
  }

  Future<void> _toggleFavorite(Book book) async {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    try {
      await BookService().toggleFavoriteBook(userId, book, _isFavorite);
    } catch (e) {
      setState(() {
        _isFavorite = !_isFavorite;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar o status de favorito: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawerScrimColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Detalhes do Livro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<Book?>(
        future: _bookFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child:
                  Text('Erro ao carregar detalhes do livro: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('Nenhum livro encontrado com o ID: ${widget.bookId}'),
            );
          } else {
            Book book = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BodySection(book: book),
                  const SizedBox(height: 34),
                  ButtonsSection(
                    isFavorite: _isFavorite,
                    onPressed: () => _toggleFavorite(book),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
