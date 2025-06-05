import '../entities/book.dart';
import '../repositories/book_repository.dart';

class AddBook {
  final BookRepository repository;

  AddBook(this.repository);

  Future<Book> call(Book book) async {
    return await repository.addBook(book);
  }
}
