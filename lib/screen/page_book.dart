import 'dart:ui';
import 'package:app_mini_project/models/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:app_mini_project/providers/all_book.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:app_mini_project/screen/page_borrow.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  // static const routeName = '/book-page';

  @override
  Widget build(BuildContext context) {
    //Provider
    final bookId = ModalRoute.of(context)?.settings.arguments as String;
    final bookData = Provider.of<Books>(context)
        .listBook
        .firstWhere((book_id) => book_id.bookId == bookId);
    //var
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
    bool _isFavorite = false;

    String _textLorem = lorem(paragraphs: 3, words: 200);
    //SCAFFOLD
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 234, 255),
      appBar: AppBar(
        title: Text("Book"),
        backgroundColor: Color.fromARGB(255, 0, 102, 128),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bookData.imgBook),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.0),
                  ),
                  child: Image.asset(
                    bookData.imgBook,
                    height: 180,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(width: 2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${bookData.titleBook}"),
                    Row(
                      children: [
                        Container(
                          child: Consumer<Book>(
                            builder: (context, value, child) => IconButton(
                              icon: (_isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border)),
                              color: Colors.red,
                              onPressed: () {
                                bookData.statusFav();
                              },
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BorrowField()));
                          },
                          child: Text("Borrow"),
                          style: raisedButtonStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Writer ${bookData.writer}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "DESKRIPSI",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(_textLorem)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
