class Book {
  final String id;
  final String title;
  final String author;
  final double rating;
  final double? price;
  final String category;
  final DateTime publicationDate;
  final String description;
  final String stock;
  final String coverImage;
  final String isbn;
  final int totalLoans;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.rating,
    this.price,
    required this.category,
    required this.publicationDate,
    required this.description,
    required this.stock,
    required this.coverImage,
    required this.isbn,
    required this.totalLoans,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] ?? '',
      publicationDate: DateTime.parse(
          json['publicationDate'] ?? DateTime.now().toIso8601String()),
      description: json['description'] ?? '',
      stock: json['stock'] ?? '',
      coverImage: json['coverImage'] ?? '',
      isbn: json['isbn'] ?? '',
      totalLoans: _parseInt(json['totalLoans']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "author": author,
      "rating": rating,
      "price": price,
      "category": category,
      "publicationDate": publicationDate.toIso8601String(),
      "description": description,
      "stock": stock,
      "coverImage": coverImage,
      "isbn": isbn,
      "totalLoans": totalLoans,
    };
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }

  Book copyWith({
    String? id,
    String? title,
    String? author,
    double? rating,
    double? price,
    String? category,
    DateTime? publicationDate,
    String? description,
    String? stock,
    String? coverImage,
    String? isbn,
    int? totalLoans,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      category: category ?? this.category,
      publicationDate: publicationDate ?? this.publicationDate,
      description: description ?? this.description,
      stock: stock ?? this.stock,
      coverImage: coverImage ?? this.coverImage,
      isbn: isbn ?? this.isbn,
      totalLoans: totalLoans ?? this.totalLoans,
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author)';
  }
}
