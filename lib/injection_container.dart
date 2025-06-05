import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// import '../../core/network/dio_client.dart';

import 'package:new_crud_app/core/networks/dio_client.dart';

import 'features/books/domain/usecases/get_books.dart';
import 'features/books/domain/usecases/add_book.dart';
import 'features/books/domain/usecases/update_book.dart';
import 'features/books/domain/usecases/delete_book.dart';

import 'features/books/presentation/bloc/book_bloc.dart';

import 'features/books/data/repositories/book_repository_impl.dart';
import 'features/books/domain/repositories/book_repository.dart';
import 'features/books/data/datasources/book_remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // External dependencies
  final dioClient = DioClient(Dio());
  getIt.registerLazySingleton<DioClient>(() => dioClient);

  // Data sources
  getIt.registerLazySingleton<BookRemoteDataSource>(
    () => BookRemoteDataSource(dioClient.dio),
  );

  // Repositories
  getIt.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetBooks>(() => GetBooks(getIt()));
  getIt.registerLazySingleton<AddBook>(() => AddBook(getIt()));
  getIt.registerLazySingleton<UpdateBook>(() => UpdateBook(getIt()));
  getIt.registerLazySingleton<DeleteBook>(() => DeleteBook(getIt()));

  // Bloc
  getIt.registerFactory(
    () => BookBloc(
      getBooks: getIt(),
      addBook: getIt(),
      updateBook: getIt(),
      deleteBook: getIt(),
    ),
  );
}
