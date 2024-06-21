import 'package:bookify/src/core/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookLoan {
  String? id;
  final Book book;
  final String userId;
  final String bookId;
  final DateTime loanDate;
  final DateTime returnDate;
  final bool? returned;

  BookLoan({
    this.id,
    required this.userId,
    required this.bookId,
    required this.loanDate,
    required this.returnDate,
    required this.book,
    this.returned = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'bookId': bookId,
      'loanDate': loanDate,
      'returnDate': returnDate,
      'book': book.toJson(),
      'returned': returned,
    };
  }

  factory BookLoan.fromJson(Map<String, dynamic> json, String id) {
    return BookLoan(
      id: id,
      userId: json['userId'] as String,
      bookId: json['bookId'] as String,
      loanDate: (json['loanDate'] as Timestamp).toDate(),
      returnDate: (json['returnDate'] as Timestamp).toDate(),
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      returned: json['returned'] as bool,
    );
  }
}
