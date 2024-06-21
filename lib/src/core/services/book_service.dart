import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookify/src/core/models/book.dart';
import 'package:bookify/src/core/models/settings_book.dart';

class BookService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Book>> fetchBooks() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('Livros').get();
      List<Book> books = snapshot.docs.map((doc) {
        return Book.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return books;
    } catch (e) {
      print('Erro ao buscar livros: $e');
      rethrow;
    }
  }

  Future<List<SettingsBooks>> fetchBooksUser(String userId) async {
    try {
      CollectionReference userBooksRef =
          _firestore.collection('userBooks').doc(userId).collection('Livros');
      QuerySnapshot snapshot = await userBooksRef.get();
      List<SettingsBooks> books = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic>? bookData = doc.data() as Map<String, dynamic>?;

        if (bookData != null) {
          SettingsBooks settingsBook = SettingsBooks.fromJson(bookData);
          String bookId = settingsBook.id;

          Book? book = await fetchBookById(bookId);

          if (book != null) {
            settingsBook = settingsBook.copyWith(book: book);
            books.add(settingsBook);
          } else {
            print('Livro com ID $bookId não encontrado.');
          }
        }
      }

      print(books);
      return books;
    } catch (e) {
      print('Erro ao buscar livros do usuário: $e');
      rethrow;
    }
  }

  Future<Book?> fetchBookById(String bookId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('Livros').doc(bookId).get();

      if (doc.exists) {
        return Book.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao buscar livro por ID: $e');
      rethrow;
    }
  }

  Future<void> updateBooks(String userId, List<SettingsBooks> books) async {
    try {
      WriteBatch batch = _firestore.batch();

      for (var book in books) {
        DocumentReference userBookRef = _firestore
            .collection('userBooks')
            .doc(userId)
            .collection('Livros')
            .doc(book.id.toString());
        batch.set(userBookRef, book.toJson(), SetOptions(merge: true));
      }

      await batch.commit();
    } catch (e) {
      print('Failed to update books: $e');
      throw Exception('Failed to update books: $e');
    }
  }

  Future<SettingsBooks> toggleFavoriteBook(
      String userId, Book book, bool favorite) async {
    SettingsBooks settingsBook = SettingsBooks.fromSettingsBooks(
      book: book,
      idUser: userId,
      id: book.id,
      favorite: favorite,
    );

    try {
      await _firestore
          .collection('userBooks')
          .doc(userId)
          .collection('Livros')
          .doc(book.id)
          .set(settingsBook.toJson(), SetOptions(merge: true));
      return settingsBook;
    } catch (e) {
      print('Erro ao atualizar o status de favorito: $e');
      throw Exception('Erro ao atualizar o status de favorito: $e');
    }
  }

  Future<SettingsBooks?> fetchSettingsBook(String userId, String bookId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('userBooks')
          .doc(userId)
          .collection('Livros')
          .doc(bookId)
          .get();

      if (snapshot.exists) {
        // Se o documento existir, retorna um objeto SettingsBooks
        return SettingsBooks.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        // Se o documento não existir, retorna null
        return null;
      }
    } catch (e) {
      // Captura e relança o erro
      print('Erro ao buscar livros: $e');
      rethrow;
    }
  }
}
