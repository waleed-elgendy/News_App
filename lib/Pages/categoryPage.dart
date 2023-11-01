import 'package:flutter/material.dart';
import 'package:news_app/SharedWidgets/NewsItemList_Builder.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 72,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text( category , style: const TextStyle(color: Colors.black, fontSize: 30)),
          const Text(" News!",
              style: TextStyle(color: Color(0xffffc300), fontSize: 30)),
        ],
      ),
      //title: Text("News"),
    ),
      body: CustomScrollView(
        slivers: [NewsItemListBuilder(category: category)],
      ),
    );
  }
}
