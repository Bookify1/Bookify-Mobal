import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/services/book_service.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/home/presenter/components/recommended_book_widget.dart';
import 'package:flutter/material.dart';

class RecommendedBooksSection extends StatelessWidget {
  const RecommendedBooksSection({super.key});
  @override
  Widget build(BuildContext context) {
    final BookService bookService = BookService();

    return FutureBuilder<List<Book>>(
      future: bookService.fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar livros.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum livro encontrado.'));
        } else {
          final books = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextApp(
                label: 'Livros Recomendados',
                color: AppColors.black,
                fontSize: AppFontSize.xxxLarge,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 260,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return RecommendedBookWidget(
                      book: book,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 24),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
