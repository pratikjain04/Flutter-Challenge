import 'package:flutter/material.dart';
import '../generic_widget/spinner_text.dart';

class ForecastAppBar extends StatefulWidget {

  String selectedDay;

  ForecastAppBar({
    this.selectedDay
  });

  @override
  ForecastAppBarState createState() => ForecastAppBarState();
}

class ForecastAppBarState extends State<ForecastAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      //don't want it to be centered
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SpinnerText(
            text: widget.selectedDay,
          ),
          Text(
            'Sacramento',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              setState(() {});
            })
      ],
    );
  }
}






