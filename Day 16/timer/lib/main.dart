import 'package:flutter/material.dart';
import 'dart:math' as math;


void main() => runApp(new MaterialApp(
  home: new MyApp(),
  theme: ThemeData(
    canvasColor: Colors.blueGrey,
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    accentColor: Colors.pinkAccent,
    brightness: Brightness.dark,
  ),
));

class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  AnimationController controller;

  //this is for displaying the time in between
  String get timerString{

    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}: ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

    //padLeft() adds a 0, if there is only single digit ,
    // eg. if 5 seconds remain, it will display 05, in this case total of 2 digits will be displayed as first argument is 2

  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 20));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                child: AspectRatio(
                    aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child){
                            return CustomPaint(
                              painter: TimerPainter(
                                animation: controller,
                                backgroundColor: Colors.white,
                                color: themeData.indicatorColor,
                              ),
                            );
                          })
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Count Down', style: themeData.textTheme.subhead,
                            ),
                            AnimatedBuilder(animation: controller, builder: (BuildContext context, Widget child){
                              return Text(timerString, style: themeData.textTheme.display4);    //display4 makes font size = 112
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      child: AnimatedBuilder(animation: controller, builder: (BuildContext context, Widget child){
                        return Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
                      }),
                      onPressed: (){
                        if (controller.isAnimating)
                          controller.stop();
                        else{
                          controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

  }




class TimerPainter extends CustomPainter {

  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;


    //c , radius , paint where c is the offset
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;  //to change the color of the filled circle
    //first the paint was of background color, and now we are setting it to color, which is the color of the timer


    double progress = (1.0 - animation.value) * 2 *math.pi; //this will convert the progress into radians
    canvas.drawArc(Offset.zero & size, math.pi*1.5, -progress, false, paint);
  }


  //this functions check if it needs to repaint the object
  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value || color != old.color || backgroundColor != old.backgroundColor;
  }
}

