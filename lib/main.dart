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
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
          color: Color(0xfffefdfd),
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          ),
        ],
        child: NewsScreen(),
      ),
    );
  }
}
