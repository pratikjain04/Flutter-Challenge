import 'dart:io';
import 'dart:async';

main(){

  String path = Directory.current.path + "/practice.txt";

  File file = new File(path);
  // ignore: deprecated_member_use
  Future<RandomAccessFile> f = file.open(mode: FileMode.APPEND);
  f.then((RandomAccessFile raf){
    print("FIle has been opened");
    raf.writeString("I am practising Dart Language's File Handling right now.").then((value) {
      print("Write Completed");
    }).catchError(()=>print("An error occured")).whenComplete(()=> raf.close());


  });

  print("*******PROCESS COMPLETED**********");





}