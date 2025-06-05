import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_event.dart';
import 'book_state.dart';

import 'package:new_crud_app/features/books/domain/usecases/get_books.dart';
import 'package:new_crud_app/features/books/domain/usecases/add_book.dart';
import 'package:new_crud_app/features/books/domain/usecases/update_book.dart';
import 'package:new_crud_app/features/books/domain/usecases/delete_book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  final AddBook addBook;
  final UpdateBook updateBook;
  final DeleteBook deleteBook;

  BookBloc({
    required this.getBooks,
    required this.addBook,
    required this.updateBook,
    required this.deleteBook,
  }) : super(BookInitial()) {
    on<GetBooksEvent>(_onFetchBooks); // Use GetBooksEvent here
    on<AddBookEvent>(_onAddBook);
    on<UpdateBookEvent>(_onUpdateBook);
    on<DeleteBookEvent>(_onDeleteBook);
  }

  Future<void> _onFetchBooks(
    GetBooksEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      final books = await getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onAddBook(AddBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      await addBook(event.book);
      emit(BookOperationSuccess());

      final books = await getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onUpdateBook(
    UpdateBookEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      await updateBook(event.book);
      emit(BookOperationSuccess());

      final books = await getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onDeleteBook(
    DeleteBookEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      await deleteBook(event.id);
      emit(BookOperationSuccess());

      final books = await getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }
}
