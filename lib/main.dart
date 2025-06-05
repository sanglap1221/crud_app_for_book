import 'package:new_crud_app/features/books/presentation/bloc/book_event.dart';
import 'package:new_crud_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/books/presentation/bloc/book_bloc.dart';
// import 'features/books/domain/usecases/get_books.dart';
// import 'features/books/domain/usecases/add_book.dart';
// import 'features/books/domain/usecases/update_book.dart';
// import 'features/books/domain/usecases/delete_book.dart';

// import 'injection.dart'; // import injection for DI setup
import 'features/books/presentation/pages/book_list_page.dart'; // your main book list page

// import 'injection_container.dart'; // Import getIt for dependency injection
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create: (_) => getIt<BookBloc>()..add(GetBooksEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter CRUD App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const BookListPage(),
      ),
    );
  }
}
