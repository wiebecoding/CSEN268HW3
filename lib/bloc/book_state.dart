part of 'book_bloc.dart';

abstract class BookState {}

class BookInital extends BookState {}

class BookSortedByTitleState extends BookState {
  final List<Book> bookList;
  BookSortedByTitleState({required this.bookList});
}

class BookSortedByAuthorState extends BookState {
  final List<Book> bookList;
  BookSortedByAuthorState({required this.bookList});
}

class BookSelectedState extends BookState {
  final Book selectedBook;
  BookSelectedState({required this.selectedBook});
}