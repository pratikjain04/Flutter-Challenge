import 'dart:io';
import 'dart:convert';

main(){

  String data = '';
  for(double i=0.0;i<100000;i++)
    data = data + "Well, I am learning how to compress data.\n";


  //ORIGINAL DATA
  List original = UTF8.encode(data); // ignore: deprecated_member_use
  //COMPRESSED DATA
  List compressed = GZIP.encode(original); // ignore: deprecated_member_use
  //DECOMPRESS DATA
  List decompressed = GZIP.decode(compressed); // ignore: deprecated_member_use


  print("Original: ${original.length} bytes");
  print("Compressed: ${compressed.length} bytes");
  print("Decompressed: ${decompressed.length} bytes");

  String decode = UTF8.decode(decompressed); // ignore: deprecated_member_use
  assert(decode == data);
  print(decode);
}