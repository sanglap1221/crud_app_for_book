import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String title;
  final String author;
  final String? coverImage;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    this.coverImage,
  });

  @override
  List<Object?> get props => [id, title, author, coverImage];
}


// class Book {
//   final String id;
//   final String title;
//   final String author;
//   final String? coverImage;

//   const Book({
//     required this.id,
//     required this.title,
//     required this.author,
//     this.coverImage,
//   });
// }

