import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/book_remote_data_source.dart';
import '../models/book_model.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Book>> getBooks() async {
    return await remoteDataSource.getBooks();
  }

  @override
  Future<Book> addBook(Book book) async {
    final bookModel = BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      coverImage: book.coverImage,
    );
    return await remoteDataSource.addBook(bookModel);
  }

  @override
  Future<Book> updateBook(String id, Book book) async {
    final bookModel = BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      coverImage: book.coverImage,
    );
    return await remoteDataSource.updateBook(id, bookModel);
  }

  @override
  Future<void> deleteBook(String id) async {
    return await remoteDataSource.deleteBook(id);
  }
}
