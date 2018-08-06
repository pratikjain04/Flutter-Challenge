import 'dart:async';

class NetworkUtil{
  //singleton class object
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();   //internal is a named constructor
  factory NetworkUtil() => _instance;


  //For Login request
  Future<dynamic> get(){
    return null;
  }



}