import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {

  final title;
  final content;
  final VoidCallback callback;    //after pressing on the content what should happen
  final actionText;               //actionText is for the "Reset" Button

  CustomDialog(this.title, this.content, this.callback,[this.actionText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
            onPressed: callback,
            color: Colors.black,
            child: new Text(actionText, style: new TextStyle(color: Colors.red),)
         )
      ],
    );
  }
}
