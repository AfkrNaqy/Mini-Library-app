import 'package:flutter/material.dart';
import 'package:app_mini_project/screen/page_book.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  List imgBook = [
    "assets/images/Image_2.jpg",
    "assets/images/Image_3.jpg",
    "assets/images/Image_4.jpg",
    "assets/images/Image_5.jpg",
  ];

  // final getImg = List.generate(
  //   imgBook.length,
  //   (index) {},
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 184, 234, 255),
        appBar: AppBar(
          title: Text("Book Category"),
          backgroundColor: Color.fromARGB(255, 0, 102, 128),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [Icon(Icons.star_purple500)],
                    ),
                    Column(
                      children: [
                        Text(
                          "BEST SELLER",
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                    Column(
                      children: [Icon(Icons.star_purple500)],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      verticalDirection: VerticalDirection.up,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 200),
                        ),
                        listBook(context)
                      ],
                    ),
                    listBook(context), //ini kolom paling kiri
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column listBook(BuildContext context) {
    return Column(
      children: List.generate(
        imgBook.length,
        (index) {
          String img = imgBook[index];
          return Container(
            // color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ini ditambahi fitur untuk menekan gambar
                // dan pindah ke page deskripsi buku
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BookPage()));
                  },
                  child: Image.asset(
                    img,
                    height: 140,
                    width: 140,
                  ),
                ),
                // Image.asset(
                //   img,
                //   height: 140,
                //   width: 140,
                // ),
                SizedBox(
                  height: 8,
                ),
                Text("Image $index"),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Column listBook_2() {
  //   return Column(
  //     verticalDirection: VerticalDirection.up,
  //     // ini kolom buku
  //     children: [
  //       Container(
  //         padding: EdgeInsets.only(top: 200.0),
  //         decoration: BoxDecoration(color: Colors.black),
  //       ),
  //       Column(
  //         children: List.generate(
  //           imgBook.length,
  //           (index) {
  //             String img = imgBook[index];
  //             return Container(
  //               color: Colors.blue,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   Image.asset(
  //                     img,
  //                     height: 140,
  //                     width: 140,
  //                   ),
  //                   SizedBox(
  //                     height: 8,
  //                   ),
  //                   Text("Image $index"),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }
