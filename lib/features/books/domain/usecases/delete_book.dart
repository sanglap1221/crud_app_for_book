import '../repositories/book_repository.dart';

class DeleteBook {
  final BookRepository repository;

  DeleteBook(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteBook(id);
  }
}
