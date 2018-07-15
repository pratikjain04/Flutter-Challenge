import 'dart:async';
int counter = 0;
main(){

Duration duration = new Duration(seconds: 1);
Timer timer = new Timer.periodic(duration, timeout);
print("Started: ${getTime()}");
}

void timeout(Timer timer){
  print("TimeOut: ${getTime()}");

  counter++;
  if(counter>=5)
    timer.cancel();

}


String getTime(){
  DateTime dt= new DateTime.now();
  return dt.toString();
}