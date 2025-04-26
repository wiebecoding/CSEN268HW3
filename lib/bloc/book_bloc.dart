import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/model/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  late List<Book> bookList;

  BookBloc(super.initialState) {
    // Initialize the book list in the constructor or init function
    bookList = [
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

    on<SortedByTitleEvent>((event, emit) {
      bookList.sort((a, b) => a.bookTitle.compareTo(b.bookTitle));
      emit(BookSortedByTitleState(bookList: bookList));
    });

    on<SortedByAuthorEvent>((event, emit) {
      bookList.sort((a, b) => a.bookAuthor.compareTo(b.bookAuthor));
      emit(BookSortedByAuthorState(bookList: bookList));
    });

    on<BookSelectedEvent>((event, emit) {
      emit(BookSelectedState(selectedBook: event.book));
    });
  }
}
