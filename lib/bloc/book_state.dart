part of 'book_bloc.dart';

@immutable
abstract class BookState {}

class BookInital extends BookState {}

class BookSortedByTitleState extends BookState {}

class BookSortedByAuthorState extends BookState {}