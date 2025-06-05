import 'package:equatable/equatable.dart';
import 'package:new_crud_app/features/books/domain/entities/book.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class GetBooksEvent extends BookEvent {}

class AddBookEvent extends BookEvent {
  final Book book;
  const AddBookEvent(this.book);

  @override
  List<Object?> get props => [book];
}

class UpdateBookEvent extends BookEvent {
  final Book book;
  const UpdateBookEvent(this.book);

  @override
  List<Object?> get props => [book];
}

class DeleteBookEvent extends BookEvent {
  final String id;
  const DeleteBookEvent(this.id);

  @override
  List<Object?> get props => [id];
}
