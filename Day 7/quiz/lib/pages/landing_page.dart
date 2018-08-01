import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),   //onTap for registring animation
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's Quiz", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
            new Text("Tap to Start!", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
          ],
        ),
      ),
    );
  }
}