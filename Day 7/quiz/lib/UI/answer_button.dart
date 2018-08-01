import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  //we need to define the data members as final, because they are immutable as the class is extending StatelessWidget

  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);


  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        //True Button
        color: _answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              //to put it inside a box we need BoxDecoration
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 3.75)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text(
                    _answer == true ? "True":"False",
                    style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}