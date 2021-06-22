import 'package:dio/dio.dart';
import 'package:mvvmnews/model/news_article.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = 'http://na';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to fetch top news");
    }
  }
}
