import 'package:flutter/material.dart';
import 'package:hw_three_app/model/book.dart';

class BookDetailWidget extends StatelessWidget{
  final Book book;
  const BookDetailWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Container(
                width: 200,
                height: 333.33,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 333.33,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(book.coverURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 353,
                child: Text(
                  book.bookTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.29,
                  ),
                ),
              ),
              SizedBox(
                width: 353,
                child: Text(
                  book.bookAuthor,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.27,
                  ),
                ),
              ),
              SizedBox(
                width: 353,
                child: Text(
                  book.bookDescription,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.43,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}