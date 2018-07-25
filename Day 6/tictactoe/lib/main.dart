import 'package:flutter/material.dart';
import 'package:tictactoe/homepage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      theme: new ThemeData(
//        primarySwatch: Colors.black
//      ),
       home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
