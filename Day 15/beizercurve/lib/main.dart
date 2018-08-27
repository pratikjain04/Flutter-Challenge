import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new HomePage(),));

class HomePage extends StatefulWidget{

  @override
  HomePageState createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: ClipPath(
            child: Image.network('https://images.pexels.com/photos/1276314/pexels-photo-1276314.jpeg?cs=srgb&dl=art-astronomy-atmosphere-1276314.jpg&fm=jpg'),
           clipper: MyClipper(),
          ),

        ),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {

  var path = new Path();
  path.lineTo(0.0, size.height);

  var firstEndPoint = new Offset(size.width/2.25, size.height-30.0);
  var firstControlPoint = new Offset(size.width/4, size.height);
  path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);


  var secondControlPoint = new Offset(size.width - (size.width/3.25), size.height - 65.0);
  var secondEndPoint = new Offset(size.width, size.height - 40.0);
  path.quadraticBezierTo( secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

  path.lineTo(size.width,size.height - 40.0);
  path.lineTo(size.width, 0.0);
  path.close();
  return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }



}