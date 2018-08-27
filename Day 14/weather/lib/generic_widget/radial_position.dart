import 'package:flutter/material.dart';
import 'dart:math';

class RadialPosition extends StatelessWidget {

  final double radius;
  final double angle;
  final Widget child;

  RadialPosition({
    this.radius,
    this.angle,
    this.child
});


  @override
  Widget build(BuildContext context) {


    final x = cos(angle)*radius;
    final y = sin(angle)*radius;

    return Transform(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: child,
    );
  }
}
