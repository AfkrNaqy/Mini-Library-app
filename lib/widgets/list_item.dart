import 'package:app_mini_project/providers/all_book.dart';

import '../screen/page_book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/model.dart';
import '../screen/page_detail.dart';

class ListItem extends StatelessWidget {
  // final String bookId;
  // final String bookTitle;
  // final String bookImg;
  // final String writer;

  const ListItem({
    Key? key,
    // required this.bookId,
    // required this.bookTitle,
    // required this.bookImg,
    // required this.writer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookData = Provider.of<Book>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: bookData.bookId);
      },
      child: Card(
        color: Color.fromARGB(255, 0, 102, 128),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              child: Container(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  bookData.imgBook,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookData.titleBook,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      // Text(widget.releasedDate),
                      Spacer(),
                      Consumer<Book>(
                        builder: (context, bookData, child) => IconButton(
                          onPressed: () {
                            bookData.statusFav();
                          },
                          icon: (bookData.isFavorite)
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
