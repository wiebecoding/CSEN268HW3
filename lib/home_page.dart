import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/bloc/book_bloc.dart';
import 'package:hw_three_app/model/book.dart';
import 'package:hw_three_app/views/detail_view.dart';
import 'package:hw_three_app/views/inital_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc(BookInital()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookSortedByTitleState) {
            return InitialView(sortby: "title", bookList: state.bookList);
          } else if (state is BookSortedByAuthorState) {
            return InitialView(sortby: "author", bookList: state.bookList);
          } else if (state is BookSelectedState) {
            return DetailView(book: state.selectedBook);
          } else {
            return InitialView(sortby: "author", bookList: []);
          }
        },
      ),
    );
  }
}
