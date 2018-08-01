import 'dart:math';
import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;      //void onTap() is same as this line of code


  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin{


  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this, duration: new Duration(seconds: 3));
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              //it will hold the icon which will show correct answer
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            child: new Transform.rotate(

                child: Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value*80.0,),
                angle: _iconAnimation.value*2*PI,
            )
            ),
            new Padding(padding: const EdgeInsets.only(top: 10.0)),
            new Text(widget._isCorrect == true ? 'Correct!' : 'Wrong!' ,style: new TextStyle(color: Colors.white, fontSize: 40.0),),
          ],
        ),
      ),
    );

  }
}
