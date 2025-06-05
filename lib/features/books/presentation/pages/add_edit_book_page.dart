import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_crud_app/features/books/domain/entities/book.dart';
import 'package:new_crud_app/features/books/presentation/bloc/book_bloc.dart';
import 'package:new_crud_app/features/books/presentation/bloc/book_event.dart';

class AddEditBookPage extends StatefulWidget {
  final Book? book;

  const AddEditBookPage({super.key, this.book});

  @override
  State<AddEditBookPage> createState() => _AddEditBookPageState();
}

class _AddEditBookPageState extends State<AddEditBookPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _coverImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _titleController.text = widget.book!.title;
      _authorController.text = widget.book!.author;
      _coverImageController.text = widget.book!.coverImage ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _coverImageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final author = _authorController.text;
      final coverImage = _coverImageController.text.isNotEmpty
          ? _coverImageController.text
          : null;

      final book = Book(
        id: widget.book?.id ?? '',
        title: title,
        author: author,
        coverImage: coverImage,
      );

      if (widget.book == null) {
        context.read<BookBloc>().add(AddBookEvent(book));
      } else {
        // context.read<BookBloc>().add(UpdateBookEvent(book.id, book));
        context.read<BookBloc>().add(UpdateBookEvent(book));
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.book != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Book' : 'Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an author' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _coverImageController,
                decoration: const InputDecoration(
                  labelText: 'Cover Image URL (Optional)',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEditing ? 'Update Book' : 'Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
