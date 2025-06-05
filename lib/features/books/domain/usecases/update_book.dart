import '../entities/book.dart';
import '../repositories/book_repository.dart';

class UpdateBook {
  final BookRepository repository;

  UpdateBook(this.repository);

  Future<Book> call(Book book) async {
    return await repository.updateBook(book.id, book);
  }

  // Future<Book> call(String id, Book book) async {
  //   return await repository.updateBook(id, book);
  // }
}
