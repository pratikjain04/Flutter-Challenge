import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
  debugShowCheckedModeBanner: false,
    home: new HomePage(),
));


class HomePage extends StatefulWidget{

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  Animation animation;
  AnimationController animationController;

  double age = 0.0;
  var selectedYear;
  var selectedMonth;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1800));
    animation = animationController;

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _showPicker(){
    showDatePicker(context: context,
        initialDate: new DateTime(2018),
        firstDate: new DateTime(1900),
        lastDate: DateTime.now()).then((DateTime dt) {
        setState(() {
          selectedYear = dt.year;
          selectedMonth = dt.month;
          calculateAge();
        });
    }
    );
  }

  void calculateAge(){
    setState(() {
      if(selectedMonth>DateTime.now().month) {
        age = (2018 - selectedYear - 1).toDouble();
        animation = Tween<double>(begin: animation.value, end: age).animate(
            new CurvedAnimation(
                parent: animationController,
                curve: Curves.fastOutSlowIn
            ));
      }
      else {
        age = (2018 - selectedYear).toDouble();
        animation = Tween<double>(begin: animation.value, end: age).animate(
            new CurvedAnimation(
                parent: animationController,
                curve: Curves.fastOutSlowIn
            ));
        animation.addListener(() {
          this.setState(() {});
        } );
      }
    });

    animationController.forward();



  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: new Text('Age Calculator')),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
                child: new Text(selectedYear!= null ? selectedYear.toString() : "Select Your Year of Birth"),
                borderSide: new BorderSide(width: 3.0, color: Colors.black),
                color: Colors.white,
                onPressed: () => _showPicker()
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Text("Your Age is ${animation.value.toStringAsFixed(0)}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
              ),

            )
          ],
        ),
      ),
    );

  }
}