import 'package:equatable/equatable.dart';
import 'package:new_crud_app/features/books/domain/entities/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;

  const BookLoaded(this.books);

  @override
  List<Object?> get props => [books];
}

class BookOperationSuccess extends BookState {}

class BookOperationFailure extends BookState {
  final String error;

  const BookOperationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
