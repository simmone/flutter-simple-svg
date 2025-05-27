abstract class Shape {
  int precision;

  String format(String shapeId);

  String unique();
  
  Shape(this.precision);
}
