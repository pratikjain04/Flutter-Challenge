import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(new MaterialApp(
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

  List<LatLng> points;
  MapController mapController;
  List<Marker> markers;
  

  @override
  void initState(){
    super.initState();
    mapController = new MapController();
    points = new List<LatLng>();
    
    points.add(new LatLng(41.8781, -87.6298));
    points.add(new LatLng(42.3314, -83.6298));
    points.add(new LatLng(42.8781, -84.6298));
    markers = new List<Marker>();

    for(int i = 0; i< points.length; i++){
      markers.add(
          new Marker(
            width: 80.0,
            height: 80.0,
            point: points.elementAt(i),
            builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.red,),
          )
      );
    }

  }


    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Maps')),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: new FlutterMap(
                    mapController: mapController,
                    options: new MapOptions(
                        center: new LatLng(41.8781, -87.6298), zoom: 15.0),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      new MarkerLayerOptions(markers: markers),
                      new PolylineLayerOptions(polylines: [
                        new Polyline(
                          points: points,
                          strokeWidth: 4.0,
                          color: Colors.purple
                        )
                      ]),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
