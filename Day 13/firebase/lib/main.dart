import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Second.dart';


void main() => runApp(new MaterialApp(home: new MyApp(),));

class MyApp extends StatefulWidget{

  @override
  MyAppState createState()=> MyAppState();
}


class MyAppState extends State<MyApp>{


  //create the instances of the FirebaseAuth and GoogleSignIn class, so that we can access their functions
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();


  //functions for Signing in and Signing out
  Future<FirebaseUser>  _signIn() async{      //since the function will return a firebase user

    //for creating google sign in account instance, we use the class GoogleSignInAccount, THIS IS NOT THE USER'S GOOGLE ACCOUNT
    GoogleSignInAccount googleSignInAccount =   await googleSignIn.signIn();

    //by googleSignIn.signIn() we get the google account of the user

    // now we need to authenticate the user
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    //now we create the FireBase user, according to the method of SignIn
    FirebaseUser user = await _auth.signInWithGoogle(idToken: gSA.idToken, accessToken: gSA.accessToken);

    //_auth is the instance of the FirebaseAuth created above
    //signInWithGoogle requires 2 parameters: idToken and accessToken

    print("UserName: ${user.displayName}");
    return user;      //user is the Future Object

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Firebase Demo')),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
              child: new Text('Sign In'),
              //After pressing the SignIn button, the _signIn() signs us in, and now we can do something by .then()
                  //Here we are using the user object and printing it to the console
                  //Also we can catch any kindof Error, where "e" is just a variable to store the error and then print it
              onPressed: () {
                _signIn().then((FirebaseUser user) {
                  print(user);
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
                }).catchError((e) => print(e));
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

