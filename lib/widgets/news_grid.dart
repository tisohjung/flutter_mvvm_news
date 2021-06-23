import 'package:flutter/material.dart';
import 'package:mvvmnews/pages/news_article_detail_screen.dart';
import 'package:mvvmnews/viewmodel/news_article_viewmodel.dart';

import 'circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid({
    Key? key,
    required this.articles,
  }) : super(key: key);

  void _showNewsArticleDetail(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(article: article);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = this.articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetail(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(imageUrl: article.imageUrl),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
