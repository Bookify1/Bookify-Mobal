import 'package:bookify/src/core/models/book.dart';

class SettingsBooks {
  final Book? book;
  final String id;
  final String idUser;
  final bool favorite;
  final bool onCart;
  final bool selected;

  SettingsBooks({
    required this.book,
    required this.id,
    required this.idUser,
    required this.favorite,
    required this.onCart,
    required this.selected,
  });

  SettingsBooks.fromSettingsBooks({
    required this.book,
    required this.id,
    required this.idUser,
    required this.favorite,
    this.onCart = false,
    this.selected = false,
  });

  factory SettingsBooks.fromJson(Map<String, dynamic> json) {
    return SettingsBooks(
      book: json['book'] != null ? Book.fromJson(json['book']) : null,
      id: json['id'],
      idUser: json['idUser'],
      favorite: json['favorite'] ?? false,
      onCart: json['onCart'] ?? false,
      selected: json['selected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book': book?.toJson(),
      'id': id,
      'idUser': idUser,
      'favorite': favorite,
      'onCart': onCart,
      'selected': selected,
    };
  }

  SettingsBooks copyWith({
    Book? book,
    String? id,
    String? idUser,
    bool? favorite,
    bool? onCart,
    bool? selected,
  }) {
    return SettingsBooks(
      book: book ?? this.book,
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      favorite: favorite ?? this.favorite,
      onCart: onCart ?? this.onCart,
      selected: selected ?? this.selected,
    );
  }

  @override
  String toString() {
    return 'SettingsBooks(book: ${book.toString()}, id: $id, idUser: $idUser, favorite: $favorite, onCart: $onCart, selected: $selected)';
  }
}
