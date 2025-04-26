part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class SortedByTitleEvent extends BookEvent {}

class SortedByAuthorEvent extends BookEvent {}

class BookSelectedEvent extends BookEvent {
  final Book book;

  BookSelectedEvent(this.book);
}