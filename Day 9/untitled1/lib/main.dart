import 'package:flutter/material.dart';
import 'package:untitled1/pages/homepage.dart';
import 'package:untitled1/pages/login/login_page.dart';

void main() => runApp(new MyApp());


final routes = {
  '/login' : (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SQLite App',
        theme: new ThemeData(
          primarySwatch: Colors.teal,
        ),
      routes: routes,
    );
  }
}


