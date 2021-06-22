import 'package:flutter/material.dart';
import 'package:mvvmnews/pages/news_screen.dart';
import 'package:mvvmnews/viewmodel/news_article_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<NewsArticleListViewModel>(
            create: (_) => NewsArticleListViewModel(),
          ),
        ],
        child: NewsScreen(),
      ),
    );
  }
}
