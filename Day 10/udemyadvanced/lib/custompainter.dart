import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp(),));

class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}

class _painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: All the work to be done here
    final radius = 100.0;
    final Offset offset = new Offset(0.0, 75.0);
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue[100]
      ..style = PaintingStyle.stroke;

// ".." means use the last object, and not the current one

    final Offset bodystart = new Offset(0.0, 50.0);
    final Offset bodyend = new Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodystart, bodyend, paint);

    final Rect rect = new Rect.fromCircle(center: offset, radius: radius);
    final Paint rectPaint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;


    canvas.drawRect(rect, rectPaint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: Always return false, else it will just chew up the battery in the background
    return false;
  }

}

class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Custom Painter')),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CustomPaint(painter: new _painter(),),
              new Text('Hello', style: new TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      ),
    );
  }
}

