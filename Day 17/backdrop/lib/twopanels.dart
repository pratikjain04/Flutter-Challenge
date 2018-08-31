import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget{

  final AnimationController controller;
  TwoPanels({this.controller});

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {

  static const header_height = 32.0;


  //For Sliding Effect

  Animation<RelativeRect> getPanelanimation(BoxConstraints constraints){
  //BoxConstraints for taking the complete space of its parent widget

    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0)
    ).animate(new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);

      return Container(
        child: Stack(
          children: <Widget>[
            Container(
              color: theme.primaryColor,
              child: Center(
                child: Text('BackPanel', style: TextStyle(fontSize: 24.0, color: Colors.white)),
              ),
            ),
            PositionedTransition(
              rect: getPanelanimation(constraints),
              child: Material(
                elevation: 12.0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Column(
                  children: <Widget>[
                        Container(
                          height: header_height,
                          child: Center(
                          child: Text(
                            "Stop Here",
                            style: Theme.of(context).textTheme.button,
                          ),
                          ),
                        ),
                    Expanded(
                        child: Center(
                      child: Text('Front Panel', style: TextStyle(fontSize: 24.0, color: Colors.black),),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }


    @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: bothPanels);
  }
  }

