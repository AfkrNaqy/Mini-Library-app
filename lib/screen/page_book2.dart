import 'package:app_mini_project/screen/page_detail.dart';
import 'package:flutter/material.dart';
import 'package:app_mini_project/models/model.dart';
import 'package:provider/provider.dart';
import 'package:app_mini_project/providers/all_book.dart';
import '../widgets/list_item.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookData = Provider.of<Books>(context).listBook;
    return MaterialApp(
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 184, 234, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 102, 128),
          title: Text("Book List"),
        ),
        body: GridView.builder(
          itemCount: bookData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 350),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: bookData[index],
              child: ListItem(),
            );
          },
        ),
      ),
    );
  }
}
