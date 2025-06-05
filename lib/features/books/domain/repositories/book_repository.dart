import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<Book> addBook(Book book);
  Future<Book> updateBook(String id, Book book);
  Future<void> deleteBook(String id);
}
