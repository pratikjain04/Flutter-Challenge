import 'package:flutter/material.dart';
import 'package:weather/forecast/forcast_list.dart';
import 'forecast/app_bar.dart';
import 'forecast/forecast.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

String selectedDay = 'Monday, August 27';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Forecast(
          radialList: forecastRadialList,
        ),

        //Defines the position of the widget and the relation of the child with the widget
        Positioned(
          //defining these as such that the appbar takes the size of the stack
          top: 0.0,
          right: 0.0,
          left: 0.0,
          child: ForecastAppBar(
            selectedDay: selectedDay,
          ),
        ),
      ],
    ));
  }
}
