import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(new MaterialApp(home: new Animate(),));

class Animate extends StatefulWidget{

  @override
  AnimateState createState()=> AnimateState();
}

class AnimateState extends State<Animate> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: new Duration(milliseconds: 5000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller); //the animation is between 0 to 500.0
    animation.addListener((){
      setState(() {
        //The State of the animation has been updated
      });
    });
    controller.forward(); //to start the animation
    }

    //if we don't dispose the controller the animation will continue running in the background, sucking the battery
    @override
  void dispose() {
      controller.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Steps'),
      ),
      body: new Container(
        height: animation.value,
        width: animation.value,
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new FlutterLogo(
            size: 300.0,
          )
        ),
      ),
    );
  }
}

