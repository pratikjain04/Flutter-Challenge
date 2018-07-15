import 'dart:io';
import 'dart:async';

main(){

  String path = Directory.current.path + "/test.txt";
  print("Appending to ${path}");

  File file = new File(path);
  Future<RandomAccessFile> f = file.open(mode: FileMode.APPEND); // ignore: deprecated_member_use
  f.then((RandomAccessFile raf) {
    print("File has been opened");
    raf.writeString("Hello Dart Language.").then((value){
      print("File has been appended");
    }).catchError(()=> print("An Error Occured")).whenComplete(()=> raf.close());
  });
  
  print("*********THE END*********");
}