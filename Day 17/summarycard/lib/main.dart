import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: new SummaryCard(),
    ));

class SummaryCard extends StatefulWidget {
  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    final uniWidth = MediaQuery.of(context).size.width;
    final uniHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            height: uniHeight / 5,
            width: uniWidth/1.1,
            child: Card(
              elevation: 4.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: uniHeight / 50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 40.0,
                          width: 40.0,
                          child: Image.asset('assets/money.jpg')),
                      Text(
                        '1200',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: uniHeight / 40),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: uniHeight / 50)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: uniWidth /42)),

                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('20.50'),
                                  Container(height: uniHeight/500, width: uniWidth/10,color: Colors.black,)
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(left: uniWidth/200)),
                              Text('->'),
                              Padding(padding: EdgeInsets.only(left: uniWidth/200)),
                              Column(
                                children: <Widget>[
                                  Text('21.50'),
                                  Container(height: uniHeight/500, width: uniWidth/10,color: Colors.black,),
                                ],
                              )
                            ],
                          ),

                      Padding(padding: EdgeInsets.only(left: uniWidth /12)),
                      Icon(
                        Icons.people,
                        color: Colors.black,
                        size: uniWidth/20,
                      ),
                      Text('163/200'),
                      Padding(
                        padding: EdgeInsets.only(left: uniWidth / 25, right: uniWidth/50),
                      ),
                      Container(
                        height: uniHeight/20,
                        width: uniWidth/4,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.attach_money),
                              Text(
                                '20',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: uniWidth / 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
