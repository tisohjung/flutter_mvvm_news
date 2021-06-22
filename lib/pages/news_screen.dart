import 'package:flutter/material.dart';
import 'package:mvvmnews/viewmodel/news_article_list_viewmodel.dart';
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
        appBar: AppBar(),
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GridTile(
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: listViewModel.articles[index].imageUrl,
                  ),
                ),
              );
            },
            itemCount: listViewModel.articles.length));
  }
}
