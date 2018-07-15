
import 'dart:io';
void main(){
print("OS: ${Platform.operatingSystem} Version: ${Platform.operatingSystemVersion} ");

if(Platform.isLinux)
  print("I am running on Linux");


print("Path:  ${Platform.script.path}");
print("Path for Dart: ${Platform.executable}");


print("Environment Vairables:  \n");
Platform.environment.keys.forEach((key){
  print("${key} ${Platform.environment[key]}");
});


}
