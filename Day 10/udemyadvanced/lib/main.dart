import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Gradient')),
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
            child: new Column(
          children: <Widget>[
            Text('Sun Shine'),
            Text(" "),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      border: new Border.all(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                      gradient: new LinearGradient(colors: <Color>[
                        Colors.orange,
                        Colors.orangeAccent,
//                        Colors.deepOrange
                      ]))),
            )
          ],
        )),
      ),
    );
  }
}
