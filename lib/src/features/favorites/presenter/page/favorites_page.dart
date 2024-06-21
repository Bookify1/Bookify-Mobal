import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/models/settings_book.dart';
import 'package:bookify/src/core/services/book_service.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/favorites/presenter/components/favorite_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<SettingsBooks> settingsBooks = [];
  final BookService _bookService = BookService();

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    final userId = AuthRepository.idUser!;
    try {
      final fetchedSettingsBooks = await _bookService.fetchBooksUser(userId);
      setState(() {
        settingsBooks = fetchedSettingsBooks;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao buscar livros: $e')),
      );
    }
  }

  Future<void> _toggleFavorite(int index) async {
    final userId = AuthRepository.idUser!;
    setState(() {
      settingsBooks[index] = settingsBooks[index]
          .copyWith(favorite: !settingsBooks[index].favorite);
    });

    try {
      await _bookService.updateBooks(userId, [settingsBooks[index]]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar livros: $e')),
      );
    }
  }

  Future<void> _addToCart(int index) async {
    final userId = AuthRepository.idUser!;
    setState(() {
      settingsBooks[index] =
          settingsBooks[index].copyWith(onCart: !settingsBooks[index].onCart);
    });

    try {
      await _bookService.updateBooks(userId, [settingsBooks[index]]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar livros: $e')),
      );
    }
  }

  List<SettingsBooks> getFavoriteBooks(List<SettingsBooks> books) {
    return books.where((book) => book.favorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    final userId = AuthRepository.idUser!;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
          minWidth: 1.sw,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 28,
                right: 28,
                top: 100,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextApp(
                    label: 'Seus favoritos',
                    fontSize: AppFontSize.xxxLarge,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  IconButton(
                    onPressed: _fetchBooks,
                    icon: const Icon(
                      Icons.refresh,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<SettingsBooks>>(
                future: _bookService.fetchBooksUser(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Erro ao carregar livros.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum livro encontrado.'));
                  } else {
                    final books = snapshot.data!;
                    final favoriteBooks = getFavoriteBooks(books);

                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 28,
                        right: 28,
                        bottom: 120,
                      ),
                      child: FavoriteBooksSection(
                        settingsBooks: favoriteBooks,
                        addCartAction: _addToCart,
                        toggleFavoriteAction: _toggleFavorite,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
