import 'package:flutter/cupertino.dart';

import '../models/model.dart';

class Books with ChangeNotifier {
  List<Book> listBook = [
    Book(
      bookId: "1",
      titleBook: "Quiet Impact: Tak Masalah Jadi Orang Introver",
      imgBook: "assets/images/Image_2.jpg",
      descBook: "",
      writer: "Sylvia Loehken",
    ),
    Book(
      bookId: "2",
      titleBook:
          "Belajar Pemrograman dan Hacking Menggunakan Python (Indonesian Edition)",
      imgBook: "assets/images/Image_4.jpg",
      descBook: "",
      writer: "Wardana",
    ),
    Book(
      bookId: "3",
      titleBook: "Adakah Orang yang Tidak Kesepian di Dunia Ini?",
      imgBook: "assets/images/Image_5.jpg",
      descBook: "",
      writer: "Ha Yooji",
    ),
    Book(
      bookId: "4",
      titleBook: "Thinking, Fast and Slow",
      imgBook: "assets/images/Image_3.jpg",
      descBook: "",
      writer: "Daniel Kahneman",
    ),
  ];
}
