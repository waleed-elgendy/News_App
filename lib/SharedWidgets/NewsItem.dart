import 'package:flutter/material.dart';
import 'package:news_app/Models/NewsItemModel.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({super.key, required this.newsItems});

  final List<NewsItemModel> newsItems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: newsItems.length,
        (context, index) => NewsItem(
          newsItems: newsItems,
          index: index,
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.newsItems,
    required this.index,
  });

  final List<NewsItemModel> newsItems;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  async {
        final Uri url = Uri.parse(newsItems[index].url!);
        if (await launchUrl(url)) {
        throw Exception('Could not launch $url');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  width: double.infinity,
                  height: 200,
                  newsItems[index].image ??
                      "https://media.istockphoto.com/id/1182477852/photo/breaking-news-world-news-with-map-backgorund.jpg?s=612x612&w=0&k=20&c=SQfmzF39HZJ_AqFGosVGKT9iGOdtS7ddhfj0EUl0Tkc=",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              newsItems[index].title ?? "???????",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              textDirection: TextDirection.ltr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              newsItems[index].subtitle ?? "",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
