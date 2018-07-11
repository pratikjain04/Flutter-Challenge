import 'package:flutter/material.dart';
import 'package:cryptomarket/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:cryptomarket/data/dependency_injection.dart';


void main() async
{
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey : Colors.cyan
      ),
      home: new HomePage(),
    );
  }
}


