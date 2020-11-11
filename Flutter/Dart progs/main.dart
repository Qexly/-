void main (){

  int x = 20;
  log(x);
  x = 34;
  log(x);
  String name = "Tom";
  log(name);
}
void log<T>(T a){

  // DateTime.now() - получает текущую дату и время
  print("${DateTime.now()} a=$a, runtimeType: ${a.runtimeType}");
}


// /D d:\Учеба\Learning\Flutter\Dart progs

