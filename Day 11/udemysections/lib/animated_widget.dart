import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


//We will change the opacity, size and orientation of the logo, in this animation


void main() => runApp(new MaterialApp(home: new MyApp(),));

class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}

class AnimatedLogo extends AnimatedWidget{

  //Since this is an AnimatedWidget, we can put any widget into animation

  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 200.0);
  static final _rotateTween = new Tween<double>(begin: 0.0, end: 12.5);

  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {

    final Animation<double> animation = listenable;
    return new Center(
      //evaluate takes the current value of animation where we are at and grabs that value
      child: new Transform.rotate(angle: _rotateTween.evaluate(animation),
      child: new Opacity(opacity: _opacityTween.evaluate(animation),
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: new FlutterLogo(),
      ),),

      ),
    );
  }

}



class MyAppState extends State<MyApp> with TickerProviderStateMixin{

  Animation animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: new Duration(milliseconds: 2300), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addListener(() { setState(() {});});
    controller.forward();
  }

  //for animation back and forth
//  void listener(AnimationStatus status){
//
//    if(status == AnimationStatus.completed)
//        controller.reverse();
//    else if(status == AnimationStatus.dismissed)
//        controller.forward();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Custom Animation')),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new AnimatedLogo(animation: animation,)
      ),
    );
  }
}

