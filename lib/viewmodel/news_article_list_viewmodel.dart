import '../model/news_article.dart';
import '../service/web_service.dart';
import 'news_article_viewmodel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = [];

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
  }
}
