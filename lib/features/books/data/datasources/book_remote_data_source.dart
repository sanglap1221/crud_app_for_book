import 'package:dio/dio.dart';
import '../models/book_model.dart';

class BookRemoteDataSource {
  final Dio dio;

  BookRemoteDataSource(this.dio);

  final String baseUrl = 'http://readbuddy-server.onrender.com/api/books';

  // final String baseUrl =
  // 'https://cors-anywhere.herokuapp.com/http://readbuddy-server.onrender.com/api/books';

  Future<List<BookModel>> getBooks() async {
    final response = await dio.get(baseUrl);

    // print(
    // '📦 Raw API response: ${response.data}',
    // ); // add this line to see raw data

    final List data = response.data;
    return data.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<BookModel> addBook(BookModel book) async {
    final response = await dio.post(baseUrl, data: book.toJson());
    return BookModel.fromJson(response.data);
  }

  Future<BookModel> updateBook(String id, BookModel book) async {
    final response = await dio.put('$baseUrl/$id', data: book.toJson());
    return BookModel.fromJson(response.data);
  }

  Future<void> deleteBook(String id) async {
    await dio.delete('$baseUrl/$id');
  }
}
