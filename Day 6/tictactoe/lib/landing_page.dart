import 'package:flutter/material.dart';
import './homepage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Material(
    color: Colors.greenAccent,
    child: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: new AssetImage('images/cropttt.jpeg'),
          fit: BoxFit.fill,
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              height: 60.0,
              width: 250.0,
              padding: new EdgeInsets.only(bottom: 20.0),
              child: new RaisedButton(
                  child: new Text('Play', style: new TextStyle(color: Colors.white),),
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage())),
                  color: Colors.greenAccent,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              ),
            )
          ],
        )
      ],
    )
  );
  }
}
