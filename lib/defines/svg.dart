import 'shape.dart';

class Svg {
  final num width;
  final num height;
  int widgetIdCount = 0;
  Map<String, Shape> shapeDefineMap = {};

  Svg(this.width, this.height);
  
  String defShape(Shape shape) {
    widgetIdCount += 1;
    String shapeId = 's${widgetIdCount}';
    shapeDefineMap[shapeId] = shape;
    return shapeId;
  }
}
