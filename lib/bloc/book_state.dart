part of 'book_bloc.dart';

@immutable
abstract class BookState {}

class BookInital extends BookState {}

class BookSortedByTitleState extends BookState {}

class BookSortedByAuthorState extends BookState {}

class BookSelectedState extends BookState {
  final Book selectedBook;

  BookSelectedState({required this.selectedBook});

  BookSelectedState copyWith({Book? selectedBook}){
    return BookSelectedState(
      selectedBook: selectedBook ?? this.selectedBook,
    );
  }
} // Need a copywith function for this state.