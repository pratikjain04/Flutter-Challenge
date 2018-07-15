import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animated Button',
      home: new HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  AnimationController buttonAnimationController;
  Animation<double> buttonAnimation;

  @override
  void initState() {
    super.initState();

    buttonAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2500));
    buttonAnimation = new CurvedAnimation(parent: buttonAnimationController, curve: Curves.elasticInOut);
    buttonAnimation.addListener(()=>this.setState((){}));
    buttonAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Center(child: new Text('Animated Button')),
        backgroundColor: Colors.teal,),
      body: new Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(
                child: new Text('Animated', style: new TextStyle(color: Colors.white),),
                color: Colors.indigo,
                height: buttonAnimation.value*60 + 0.50,
                minWidth: buttonAnimation.value*80 + 0.50,
                onPressed: ((){}),

              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: new FlutterLogo(
                  size: buttonAnimation.value * 100,
                  //the _iconAnimation.value lies between 0 to 1. We don't need such small image therefore we multiply by 100
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }


}

