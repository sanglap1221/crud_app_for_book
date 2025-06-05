import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:crud_app/features/books/bloc/book_bloc.dart';
import 'package:new_crud_app/features/books/presentation/bloc/book_bloc.dart';

// import 'package:crud_app/features/books/bloc/book_event.dart';
import 'package:new_crud_app/features/books/presentation/bloc/book_event.dart';

// import '../../bloc/book_state.dart';
import 'package:new_crud_app/features/books/presentation/bloc/book_state.dart';
// import '/home/sanglap/Desktop/Crud_book/crud_app/lib/features/books/presentation/bloc/book_state.dart';
import 'add_edit_book_page.dart';
// import '../widgets/book_item_tile.dart';
import 'package:new_crud_app/features/books/presentation/pages/widgets/book_item_tile.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(GetBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<BookBloc>().add(GetBooksEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            final books = state.books;
            if (books.isEmpty) {
              return const Center(child: Text("No books found."));
            }
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return BookItemTile(book: book);
              },
            );
          } else if (state is BookOperationFailure) {
            return Center(child: Text(state.error));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditBookPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
