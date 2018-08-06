import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:untitled1/model/user.dart';

class DataBaseHelper {

  //since there will be only one database for a complete application, therefore defining a singleton object
  static final DataBaseHelper _instance = new DataBaseHelper.internal();
  DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async{
    if(_db!= null)
      return _db;
  //kind of else
    _db = await initDb();
    return _db;
  }

  initDb() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db"); //it will join the document path and "main.db"
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print("Table is Created Successfully");
  }

  //insertion
  Future<int> saveUser(User user) async{
    var dbClient = await db;
    int res = await dbClient.insert('User', user.toMap()); //response
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async{
    var dbClient = await db;
    int res = await dbClient.delete('User'); //response
    return res;
  }




}


