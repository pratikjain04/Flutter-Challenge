import 'dart:io';

main(){
//This code runs in the directory we are currently working in, in this case its, codegeek
//"ls" is the command
//"-l" is the argument, I can replace it with anything like -H, for human readable
//This is async so we need to work with "then" keyword
  Process.run('ls',['-H']).then((ProcessResult results){
    print(results.stdout);
    print("Exit Code:  ${results.exitCode}");   //0 exitCode means process executed without any errors
  });
}