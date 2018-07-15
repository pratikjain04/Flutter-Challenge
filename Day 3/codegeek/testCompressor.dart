import 'dart:async';
import 'dart:convert';
import 'dart:io';

main(){
  int zlib = testCompress(ZLIB); // ignore: deprecated_member_use
  int gzip = testCompress(GZIP); // ignore: deprecated_member_use
  print("ZLIB: $zlib");
  print("GZIP: $gzip");

}

String genData(){
  String data = '';
  for(int i=0;i<1000;i++)
    data = data + 'Hello World\n';
  return data;
}


int testCompress(var codec){

  String data = genData();

  List original = UTF8.encode(data); // ignore: deprecated_member_use
  List compressed = codec.encode(original);
  List decompressed =  codec.decode(compressed);
  
  print("Testing: ${codec.toString()}");
  print("Original: ${original.length} bytes");
  print("Compressed: ${compressed.length} bytes");
  print("Decompressed: ${decompressed.length} bytes");

  print("");

  String decoded = UTF8.decode(decompressed); // ignore: deprecated_member_use
  assert(data == decoded);

  return compressed.length;



}