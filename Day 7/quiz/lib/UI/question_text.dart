import 'package:flutter/material.dart';
class QuestionText extends StatefulWidget {

   final String _question;
   final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {


  //SingleTickerProviderStateMixin class provides a singleticker for vsync object

  AnimationController fontSizeAnimationController;   //lies between 0 to 1 usually, but make sure to check the graph of the curve used online
  Animation<double> fontSizeAnimation;

  //the objects to these data members are initialized inside the initState() method

  @override
  void initState() {
    super.initState();
    fontSizeAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1350));
    //vsync handles the animation which goes outside the screen for us
    fontSizeAnimation = new CurvedAnimation(parent: fontSizeAnimationController, curve: Curves.bounceOut);
    //we need to update our state dynamically along with the animation, and save the state, so we need to call setState() by adding a animation listerner

    fontSizeAnimation.addListener(() => this.setState((){}));
    fontSizeAnimationController.forward();

  }

  //its mandatory to dispose the animationController if you want to reuse it again in the same app cycle
  @override
  void dispose() {
    fontSizeAnimationController.dispose();
    super.dispose();

  }

  //for continue animation of all the question and not only during the start of the app , we override one more method

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    //we compare the oldWidgets with the new widgets, therefore we can check if the questions are different
    if(oldWidget._question!=widget._question)
      {
        fontSizeAnimationController.reset();
        fontSizeAnimationController.forward();
      }
  }


  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Statement " + widget._questionNumber.toString() + ": " + widget._question,
            style: new TextStyle(fontSize: fontSizeAnimation.value*15),
          ),
        ),
      ),
    );

  }
}
