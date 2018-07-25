import 'package:flutter/material.dart';

class GameButton{

  int id;
  Color bg;
  bool enabled;
  String text;

  GameButton({this.id, this.text="", this.bg = Colors.lightBlueAccent, this.enabled = true});

}