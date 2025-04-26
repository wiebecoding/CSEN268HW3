import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/model/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(super.initialState) {
    on<SortedByTitleEvent>((event, emit) {
      emit(BookSortedByTitleState());
    });
    on<SortedByAuthorEvent>((event, emit) {
      emit(BookSortedByAuthorState());
    });
    on<BookSelectedEvent>((event, emit) {
      emit(BookSelectedState(selectedBook: event.book));
    });
  }
}
