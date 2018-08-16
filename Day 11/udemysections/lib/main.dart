import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp(),));

class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin{

  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: new Duration(milliseconds: 5000),vsync: this);

    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 50.0, end: 300.0).animate(curve);
    animation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status){

    if(status == AnimationStatus.completed){
      controller.reverse();
    }
    else if (status == AnimationStatus.dismissed)
        controller.forward();
    }



  Widget builder(BuildContext context, Widget child){

    return new Container(
      height: animation.value,
      width: animation.value,
      child: new FlutterLogo(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Animation')),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new AnimatedBuilder(animation: animation, builder: builder)
        ),
      ),
    );
  }
}

