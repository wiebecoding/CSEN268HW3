import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/bloc/book_bloc.dart';
import 'package:hw_three_app/model/book.dart';
import 'package:hw_three_app/widgets/book_detail_widget.dart';

class DetailView extends StatelessWidget {
  final Book book;
  const DetailView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BookBloc>().add(SortedByTitleEvent());
          },
        ),
        title: const Text("Book Detail"),
        centerTitle: true,
        actions: [SizedBox(width: 56, child: Icon(Icons.account_circle))],
      ),
      body: SingleChildScrollView(
        child: BookDetailWidget(book: book)
      ),
    );
  }
}
