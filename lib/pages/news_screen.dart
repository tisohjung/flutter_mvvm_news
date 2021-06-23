import 'package:flutter/material.dart';
import 'package:mvvmnews/utils/constants.dart';
import 'package:mvvmnews/viewmodel/news_article_list_viewmodel.dart';
import 'package:mvvmnews/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (country) {
                listViewModel
                    .topCountryHeadlines(Constants.Countries[country]!);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return Constants.Countries.keys
                    .map((v) => PopupMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList();
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "News",
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(
              color: Color(0xffff8a30),
              height: 40,
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                "Headline",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: NewsGrid(articles: listViewModel.articles),
            ),
          ],
        ),
      ),
    );
  }
}
