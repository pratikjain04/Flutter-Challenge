import 'package:flutter/material.dart';
import 'radial_list.dart';


final RadialListViewModel forecastRadialList = new RadialListViewModel(
  items: [
   RadialListItemViewModel(
     icon: AssetImage('assets/ic_rain.png'),
     title: '11.30',
     subtitle: 'Light Rain',
     isSelected: true
   ),
   RadialListItemViewModel(
       icon: AssetImage('assets/ic_rain.png'),
       title: '12.30P',
       subtitle: 'Light Rain',
       isSelected: true
   ),
   RadialListItemViewModel(
       icon: AssetImage('assets/ic_cloudy.png'),
       title: '1.30P',
       subtitle: 'Cloudy',
       isSelected: true
   ),
   RadialListItemViewModel(
       icon: AssetImage('assets/ic_sunny.png'),
       title: '2.30',
       subtitle: 'Sunny',
       isSelected: true
   ),
   RadialListItemViewModel(
       icon: AssetImage('assets/ic_sunny.png'),
       title: '3.30',
       subtitle: 'Sunny',
       isSelected: true
   ),

  ]
);


