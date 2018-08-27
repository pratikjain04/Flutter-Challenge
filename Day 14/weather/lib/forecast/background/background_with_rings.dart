import 'package:flutter/material.dart';

class BackgroundWithRings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,   //makes the children as large as the screen
      children: <Widget>[
        Image.asset(
          'assets/weather-bk_enlarged.png',
          fit: BoxFit.cover,    //covers screen
        ),

        ClipOval(
          clipper: new CircleClipper(
            radius: 140.0,
            offset: const Offset(40.0, 0.0),
          ),
          child: Image.asset(
            'assets/weather-bk.png',
            fit: BoxFit.cover,
          ),
        ),
        CustomPaint(
          painter: WhiteCircleCutoutPainter(
              centerOffset: Offset(40.0, 0.0),
              circles: [
                Circle(radius: 140.0, alpha: 0x10),
                Circle(radius: 140.0+15.0, alpha: 0x28),
                Circle(radius: 140.0+30.0, alpha: 0x38),
                Circle(radius: 140.0+75.0, alpha: 0x50),
              ]
          ),
          child: Container(),   //just a throw away container
        )
      ],
    );
  }
}


class CircleClipper extends CustomClipper<Rect>{

  final double radius;
  final Offset offset;

  CircleClipper({
    this.radius,
    this.offset = const Offset(0.0, 0.0)
  });


  @override
  Rect getClip(Size size) {

    return Rect.fromCircle(
        center: Offset(0.0, size.height/2) + offset,
        radius: radius
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

}


class WhiteCircleCutoutPainter extends CustomPainter{

  final Color overlayColor = const Color(0xFFAA88AA);

  final List<Circle> circles;
  final Offset centerOffset;
  final Paint whitePaint; //for white circles
  final Paint borderPaint;  //for bordering all the concentric circles

  WhiteCircleCutoutPainter({
    this.circles = const [],
    this.centerOffset = const Offset(0.0, 0.0),

  }) : whitePaint= new Paint(),
        borderPaint = new Paint(){
    borderPaint
      ..color = const Color(0x10FFFFFF)       //very translucent white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
  }

  @override
  void paint(Canvas canvas, Size size) {

    for(var i = 1; i < circles.length; i++){

      //for every iteration, we can mask the circle
      _maskCircle(canvas, size, circles[i-1].radius);
      whitePaint.color = overlayColor.withAlpha(circles[i-1].alpha);


      //FIll Circle

      canvas.drawCircle(
        new Offset(0.0, size.height/2) + centerOffset,
        circles[i].radius,
        whitePaint,
      );

      //Draw circle bevel
      canvas.drawCircle(
          new Offset(0.0, size.height/2) + centerOffset,
          circles[i-1].radius,    //this will draw for all but the last circle
          borderPaint
      );
    }

    //after the loop, print the whole screen leaving out the final circle


    //Mask the area of the last circle
    _maskCircle(canvas, size, circles.last.radius);

    //Draw the overlay which fills the rest of the screen
    //using the last circle's alpha to have some opacity effect
    whitePaint.color = overlayColor.withAlpha(circles.last.alpha);
    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        whitePaint
    );

    //Draw the bevel for the final circle

    canvas.drawCircle(
      new Offset(0.0, size.height/2) + centerOffset ,
      circles.last.radius,
      borderPaint,
    );
  }

  _maskCircle(Canvas canvas, Size size, double radius){
    Path clippedCircle = new Path();
    clippedCircle.fillType = PathFillType.evenOdd;

    //First put the background rectangle and the clip the circle out of it
    clippedCircle.addRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    //now we will mask out the oval shape

    clippedCircle.addOval(
      new Rect.fromCircle(
          center: new Offset(0.0, size.height/2) + centerOffset,
          radius: radius
      ),
    );
    canvas.clipPath(clippedCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class Circle{

  final double radius;
  final int alpha;

  Circle({
    this.radius,
    this.alpha = 0xFF,
  });

}