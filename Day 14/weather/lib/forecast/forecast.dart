import 'package:flutter/material.dart';
import 'package:weather/forecast/radial_list.dart';
import 'background/background_with_rings.dart';


class Forecast extends StatelessWidget {

  RadialListViewModel radialList;

  Forecast({

  @required
  this.radialList
  });

  Widget _temperatureText(){

  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(top: 150.0, left: 10.0),
      child: Opacity(
        opacity: 0.63,
        child: Text(
              '68°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 68.0,
              ),
        ),
      ),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        BackgroundWithRings(),
        _temperatureText(),
        RadialList(
          radialList: radialList,
        )
        //new RadialList()
      ],
    );
  }
}
