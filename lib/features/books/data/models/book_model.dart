import '../../domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    super.coverImage,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id']?.toString() ?? '', // to empty string
      title: json['title']?.toString() ?? 'Untitled', // ensure String
      author: json['author']?.toString() ?? 'Unknown',
      coverImage: json['coverImage']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      if (coverImage != null) 'coverImage': coverImage,
    };
  }
}
