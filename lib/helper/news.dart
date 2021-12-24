import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=69811e57abbd4bd7b6d2d3c7fafc3496";
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = jsonDecode(response.body);

      jsonData["articles"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          author: element["author"].toString(),
          title: element["title"].toString(),
          description: element["description"].toString(),
          url: element["url"].toString(),
          urlToimage: element["urlToImage"].toString(),
          content: element["content"].toString(),
        );
        news.add(articleModel);
      });
    } else {
      print(response.body);
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=69811e57abbd4bd7b6d2d3c7fafc3496";
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = jsonDecode(response.body);

      jsonData["articles"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          author: element["author"].toString(),
          title: element["title"].toString(),
          description: element["description"].toString(),
          url: element["url"].toString(),
          urlToimage: element["urlToImage"].toString(),
          content: element["content"].toString(),
        );
        news.add(articleModel);
      });
    } else {
      print(response.body);
    }
  }
}
