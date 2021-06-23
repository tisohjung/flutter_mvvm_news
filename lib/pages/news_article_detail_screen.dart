import 'package:flutter/material.dart';
import 'package:mvvmnews/viewmodel/news_article_viewmodel.dart';
import 'package:mvvmnews/widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  const NewsArticleDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Author",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    this.article.author,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Divider(
                  color: Color(0xffff8a30),
                  height: 80,
                  thickness: 20,
                ),
                Text(
                  "Headline",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              this.article.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 200,
              child: CircleImage(
                imageUrl: this.article.imageUrl,
              ),
            ),
            SizedBox(height: 30),
            Text(
              this.article.description,
              style: TextStyle(
                fontSize: 16,
                wordSpacing: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
