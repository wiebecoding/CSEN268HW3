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
    List<Book> bookList = [
      Book(
        bookTitle: "1984",
        bookAuthor: "George Orwell",
        bookDescription: "A dystopian novel set in a totalitarian society.",
        coverURL: "https://m.media-amazon.com/images/I/71rpa1-kyvL.jpg",
      ),
      Book(
        bookTitle: "To Kill a Mockingbird",
        bookAuthor: "Harper Lee",
        bookDescription: "A novel about racial injustice in the Deep South.",
        coverURL:
            "https://m.media-amazon.com/images/I/81aY1lxk+9L._AC_UF1000,1000_QL80_.jpg",
      ),
      Book(
        bookTitle: "The Great Gatsby",
        bookAuthor: "F. Scott Fitzgerald",
        bookDescription: "A story of wealth, love, and the American Dream.",
        coverURL: "https://m.media-amazon.com/images/I/81n682DOVAL.jpg",
      ),
      Book(
        bookTitle: "Moby Dick",
        bookAuthor: "Herman Melville",
        bookDescription: "A tale of obsession and revenge on the high seas.",
        coverURL: "https://m.media-amazon.com/images/I/610qaD5PskL.jpg",
      ),
      Book(
        bookTitle: "Pride and Prejudice",
        bookAuthor: "Jane Austen",
        bookDescription: "A romantic novel about manners and marriage.",
        coverURL:
            "https://m.media-amazon.com/images/I/91E9-FyfvGL._AC_UF1000,1000_QL80_.jpg",
      ),
    ];

    return BlocProvider(
      create: (context) => BookBloc(BookInital()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          switch (state) {
            case BookSortedByTitleState _:
              return InitialView(sortby: "title", bookList: bookList);
            case BookSortedByAuthorState _:
              return InitialView(sortby: "author", bookList: bookList);
            case BookSelectedState _:
              final book = state.selectedBook;
              return DetailView(book: book);
            default:
              return InitialView(sortby: "author", bookList: bookList);
          }
        },
      ),
    );
  }
}
