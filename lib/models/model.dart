import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier {
  final String bookId;
  final String titleBook;
  final String imgBook;
  final String descBook;
  final String writer;
  bool isFavorite;

  Book(
      {required this.bookId,
      required this.titleBook,
      required this.imgBook,
      required this.descBook,
      required this.writer,
      this.isFavorite = false});

  void statusFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
