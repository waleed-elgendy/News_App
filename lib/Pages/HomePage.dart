import 'package:flutter/material.dart';
import 'package:news_app/SharedWidgets/NewsItemList_Builder.dart';
import 'package:news_app/SharedWidgets/categroyItem.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Breaking", style: TextStyle(color: Colors.black, fontSize: 30)),
              Text(" News!",
                  style: TextStyle(color: Color(0xffffc300), fontSize: 30)),
            ],
          ),
          //title: Text("News"),
        ),
        body: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoryItem(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 28,
              ),
            ),
            NewsItemListBuilder(category: "general"),
          ],
        ));
  }
}
