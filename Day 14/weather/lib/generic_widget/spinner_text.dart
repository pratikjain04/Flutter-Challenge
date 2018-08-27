import 'package:flutter/material.dart';

class SpinnerText extends StatefulWidget {

  final String text;

  SpinnerText({
   this.text = ''
});

  @override
  _SpinnerTextState createState() => _SpinnerTextState();
}

class _SpinnerTextState extends State<SpinnerText> with SingleTickerProviderStateMixin {


  String topText = '';
  String bottomText = '';
  AnimationController _spinnerTextAnimationController;
  Animation<double> _spinAnimation;


  @override
  void initState() {
    super.initState();
    bottomText = widget.text;
    _spinnerTextAnimationController = AnimationController(
      duration: Duration(milliseconds: 750),
      vsync: this,
    )
    ..addListener(() => setState(() {} ))
    ..addStatusListener((AnimationStatus status){
       if(status == AnimationStatus.completed){
         setState(() {
           bottomText = topText;
           topText = '';
           _spinnerTextAnimationController.value = 0.0;
         });
       }
    });

    _spinAnimation = CurvedAnimation(parent: _spinnerTextAnimationController, curve: Curves.elasticInOut);
  }

  @override
  void dispose() {
    _spinnerTextAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SpinnerText oldWidget) {

    super.didUpdateWidget(oldWidget);

    if(widget.text != oldWidget.text) {
        //need to spin new value
        topText = widget.text;
        _spinnerTextAnimationController.forward();

      }
  }

  @override
  Widget build(BuildContext context) {
    //using stack because it will only be as large as a single text widget
    //we don't use column, because it will show both the texts
    return ClipRect(
      clipper: RectClipper(),
      child: Stack(
        children: <Widget>[
          FractionalTranslation(
            translation: Offset(0.0, _spinAnimation.value-1.0),
            child: Text(
              'Top Text',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,    //incase it overflows
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
              ),
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, _spinAnimation.value),
            child: Text(
              'Bottom Text',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,    //incase it overflows
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class RectClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

}