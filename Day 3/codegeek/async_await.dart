import 'dart:io';
import 'dart:async';

main() async{
  print("Staring to Read from the file");
  String file = await readFile();
  print(file);

}

Future<String> readFile(){

  File file = new File(Directory.current.path + "/test.txt");
  return file.readAsString();
}