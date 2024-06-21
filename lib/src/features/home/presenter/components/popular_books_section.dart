import 'package:flutter/material.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/services/book_service.dart';
import 'package:bookify/src/features/home/presenter/components/popular_books_widget.dart';
import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';

class PopularBooksSection extends StatelessWidget {
  const PopularBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final BookService _bookService = BookService();

    return FutureBuilder<List<Book>>(
      future: _bookService.fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar livros.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum livro encontrado.'));
        } else {
          final List<Book> books = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextApp(
                label: 'Livros Populares',
                color: AppColors.black,
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 32),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: books.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return PopularBookWidget(
                    book: books[index],
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
