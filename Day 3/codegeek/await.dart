import 'dart:io';
import 'dart:async';

main() async{

  print("Starting.....");
  File file = await appendFile();

  //Here we are using "await and async" because the appendFile() is returning a Future object.
  //So, it will not returning the object directly when the function is called. We have to await for the object to be returned and that's
  //why we use <Future> which means that the object will be returned in near future


  print("Appended to file: ${file.path}");
  print("********END**********");

}

Future<File> appendFile(){
  File file = new File(Directory.current.path + "/await.txt");
  DateTime now = new DateTime.now();
  return file.writeAsString(now.toString()+ '\n', mode: FileMode.APPEND); // ignore: deprecated_member_use
}