void main (){

  Figure rect = Rectangle(20, 30);
  rect.calculateArea();
}
abstract class Figure {
  void calculateArea(){
    print("Not Implemented");
  }
}
class Rectangle extends Figure{

  int width;
  int height;
  Rectangle(this.width, this.height);


}


// /D d:\Учеба\Flutter\Dart progs