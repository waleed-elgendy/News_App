import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsItemModel.dart';
import 'package:news_app/Services/GetNews.dart';
import 'package:news_app/SharedWidgets/NewsItem.dart';

class NewsItemListBuilder extends StatefulWidget {
  const NewsItemListBuilder({required this.category,super.key});
  final String category;
  @override
  State<NewsItemListBuilder> createState() => _NewsItemListBuilderState();
}

Future<List<NewsItemModel>>? future;


class _NewsItemListBuilderState extends State<NewsItemListBuilder> {
  @override
  void initState() {
    super.initState();
    future = GetData(Dio(),widget.category).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListview(
              newsItems: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.only(left: 28),
                child: Center(
                  child: Text(
                      //maxLines: 1,
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                      "Sorry, there was an error please close app and open it again"),
                ),
              ),
            );
          } else {
            return const SliverFillRemaining(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
