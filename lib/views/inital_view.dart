import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_three_app/bloc/book_bloc.dart';
import 'package:hw_three_app/model/book.dart';
import 'package:hw_three_app/widgets/book_cover_widget.dart';

class InitialView extends StatefulWidget {
  final String sortby;
  final List<Book> bookList;

  const InitialView({super.key, required this.sortby, required this.bookList});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  late BookBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<BookBloc>(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    print('Sort by: ${widget.sortby}');
    if (widget.sortby == "author"){
      widget.bookList.sort((a, b) {
        return a.bookAuthor.compareTo(b.bookAuthor);
      });
    }else{
      widget.bookList.sort((a, b) {
        return a.bookTitle.compareTo(b.bookTitle);
      });
    }
    
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
        leading: Icon(Icons.menu),
        title: const Text("Book Club Home"),
        centerTitle: true,
        actions: [SizedBox(width: 56, child: Icon(Icons.account_circle))],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 00, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Sort by',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.43,
                          letterSpacing: 0.10,
                        ),
                      ),
                      Container(
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color:
                              widget.sortby == 'author'
                                  ? const Color(
                                    0x1E49454F,
                                  ) /* State-Layers-On-Surface-Variant-Opacity-12 */
                                  : const Color(
                                    0xFFFEF7FF,
                                  ) /* Schemes-Surface */,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(
                                0xFFCAC4D0,
                              ) /* Schemes-Outline-Variant */,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                              ),
                              onPressed: () {
                                bloc.add(SortedByAuthorEvent());
                              },
                              child: Text(
                                'Author',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(
                                    0xFF49454F,
                                  ) /* Schemes-On-Surface-Variant */,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color:
                              widget.sortby == 'title'
                                  ? const Color(
                                    0x1E49454F,
                                  ) /* State-Layers-On-Surface-Variant-Opacity-12 */
                                  : const Color(0xFFFEF7FF),
                          /* Schemes-Surface */
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(
                                0xFFCAC4D0,
                              ) /* Schemes-Outline-Variant */,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                              ),
                              onPressed: () {
                                bloc.add(SortedByTitleEvent());
                              },
                              child: Text(
                                'Title',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(
                                    0xFF49454F,
                                  ) /* Schemes-On-Surface-Variant */,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Books',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF1D1B20) /* Schemes-On-Background */,
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.29,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            //padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.bookList.length,
                  itemBuilder: (BuildContext context, int index){
                    return BookCoverWidget(book: widget.bookList[index]);
                  },
                )
              )
            ),
        ],
      ),
    );
  }
}
