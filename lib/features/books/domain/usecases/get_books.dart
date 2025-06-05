import '../entities/book.dart';
import '../repositories/book_repository.dart';

class GetBooks {
  final BookRepository repository;

  GetBooks(this.repository);

  Future<List<Book>> call() async {
    return await repository.getBooks();
  }
}
// import '../entities/book.dart';
// import '../repositories/book_repository.dart';

// class GetBooksUseCase {
//   final BookRepository repository;

//   GetBooksUseCase(this.repository);

//   Future<List<Book>> call() async {
//     return await repository.getBooks();
//   }
// }
