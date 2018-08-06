import 'package:flutter/material.dart';
import 'package:untitled1/data/database_helper.dart';
import 'package:untitled1/model/user.dart';
import 'package:untitled1/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageContract{  //implementing a contract

  BuildContext _ctx;
  bool _isLoading;
  final formKey = new GlobalKey<FormState>(); //we will pass this key to the form that we will use later
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  LoginPagePresenter _presenter;
  _LoginPageState(){
    _presenter = new LoginPagePresenter(this);
  }

  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(text)));

  }

  //we need to build a form, for a loginPage
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
        onPressed: _submit,
        child: new Text('Login'),
        color: Colors.green,
    );
    var loginForm = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('Sqflite App Login', textScaleFactor: 2.0,),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => _username = val,
                    decoration: new InputDecoration(labelText: "Username"),
                  ),

              ),
              new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new TextFormField(
              onSaved: (val) => _username = val,
              decoration: new InputDecoration(labelText: "Password"),
              obscureText: true,
              ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(title: Center(child: new Text('Login Page')),),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),

    );
  }


  @override
  void onLoginError(User user) {
    _showSnackBar("Error");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async  {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });

    var db = new DataBaseHelper();
    await db.saveUser(user);
    Navigator.of(context).pushNamed('/home');
  }
}
