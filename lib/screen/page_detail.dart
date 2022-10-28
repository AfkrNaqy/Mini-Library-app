import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_mini_project/providers/all_book.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:app_mini_project/screen/page_borrow.dart';

import '../models/model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const routeName = '/detail-page';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorite = false;

//DESIGN
  void _toogleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //perubahan
    final bookId = ModalRoute.of(context)?.settings.arguments as String;
    final bookData = Provider.of<Books>(context)
        .listBook
        .firstWhere((book_id) => book_id.bookId == bookId);
    //BUTTON
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Color.fromARGB(255, 0, 102, 128),
      primary: Colors.white,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
    //DESIGN

    //Var
    bool _isFavorite = false;
    String _textLorem = lorem(paragraphs: 3, words: 200);
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
                color: Color.fromARGB(255, 0, 102, 128),
                border: Border.symmetric(
                  horizontal: BorderSide(width: 2, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        "${bookData.titleBook}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: IconButton(
                            icon: (_isFavorite
                                // ignore: dead_code
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border)),
                            color: Colors.red,
                            onPressed: _toogleFavorite,
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
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Writer ${bookData.writer}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
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
      // Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         child: Image.asset(bookData.imgBook),
      //       ),
      //       Text("${bookData.titleBook}"),
      //       Text("${bookData.writer}"),
      //     ],
      //   ),
      // ),
    );
  }
}
