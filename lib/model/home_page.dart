
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/bloc/book_bloc.dart';
import 'package:hw_three_app/views/inital_view.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc(BookInital()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          switch (state) {
            case BookSortedByTitleState _:
              return InitialView(sortby: "title",);
            case BookSortedByAuthorState _:
              return InitialView(sortby: "author",);
            default:
              return InitialView(sortby: "author",);
          }
        },
      ),
    );
  }


}