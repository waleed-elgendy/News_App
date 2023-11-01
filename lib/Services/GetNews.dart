import 'package:dio/dio.dart';
import 'package:news_app/Models/NewsItemModel.dart';

class GetData {
  String category="general";
  final Dio dio;
  GetData(this.dio,this.category);

  Future<List<NewsItemModel>> getNews() async {
    try{
      var response = await dio.get(
          "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=2ee825f91493437da7ee216e646b3028");

      var jsondata = response.data;
      var articlesList = jsondata['articles'];

      List<NewsItemModel> newsItems = [];
      for (var article in articlesList) {
        newsItems.add(
          NewsItemModel(image: article['urlToImage'],url:  article['url'],title:  article['title'],
              subtitle: article['description']),
        );
      }

      return newsItems;
    }catch(e){

      return [];
    }
  }
}

