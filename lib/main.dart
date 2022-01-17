import 'package:blog_web/blog_post.dart';
import 'package:blog_web/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

var theme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText2: TextStyle(fontSize: 22, height: 1.4),
    caption: TextStyle(fontSize: 18, height: 1.4),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<List<BlogPost>>(create: (context) => _blogPost),
        Provider<User>(
          create: (context) => User(
              name: 'Flutter Dev',
              profilePicture:
                  'https://avatars.githubusercontent.com/u/42906958?v=4'),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Dev Blog',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}

final _blogPost = [
  BlogPost(
    title: 'What is provider ? ',
    publishedDate: DateTime(2020, 1, 2),
    body: "Provider",
  ),
  BlogPost(
    title: 'What is multi-provider ? ',
    publishedDate: DateTime(2020, 2, 3),
    body: "Multi Provider",
  ),
];
