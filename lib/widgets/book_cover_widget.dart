import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/model/book.dart';
import 'package:hw_three_app/bloc/book_bloc.dart';

class BookCoverWidget extends StatelessWidget {
  final Book book;
  const BookCoverWidget({super.key, required this.book});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your desired functionality here, e.g., navigate to a detail page
        context.read<BookBloc>().add(BookSelectedEvent(book));
      },
      child: Container(
        width: 120,
        height: 166.67,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 100,
                height: 166.67,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.coverURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
