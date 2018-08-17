import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp(),));

const Color loaderColor = const Color(0xFFE15B64);


class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: loaderColor,
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Image(image: new AssetImage('images/whiteloader.gif'))
        ),
      ),
    );
  }
}

