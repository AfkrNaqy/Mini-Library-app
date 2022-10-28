import 'package:app_mini_project/providers/all_book.dart';
import 'package:app_mini_project/screen/page_book.dart';
import 'package:app_mini_project/screen/page_book2.dart';
import 'package:app_mini_project/screen/page_borrow.dart';
import 'package:app_mini_project/screen/page_category.dart';
import 'package:app_mini_project/screen/page_detail.dart';
import 'package:app_mini_project/screen/page_login.dart';
import 'package:app_mini_project/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:app_mini_project/screen/page_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Books()),
      ],
      child: MaterialApp(
        home: LoginPage(),
        routes: {
          DetailPage.routeName: (context) => DetailPage(),
        },
      ),
    );
  }
}
