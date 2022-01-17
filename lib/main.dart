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
    return Provider(
      create: (context) => DateTime(2020, 1, 2),
      child: Provider<String>(
        create: (BuildContext context) => 'What is provider ?',
        child: MaterialApp(
          title: 'Flutter Dev Blog',
          theme: theme,
          home: const HomePage(),
        ),
      ),
    );
  }
}