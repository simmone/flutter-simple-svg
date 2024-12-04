import 'shape.dart';

class Rect implements Shape {
  final num width;
  final num height;
  num? radiusX;
  num? radiusY;
  
  Rect(this.width, this.height, [this.radiusX, this.radiusY]);
  
  @override
  String format(String shapeId) {
    final buffer = StringBuffer();
    
    buffer.write('    <rect id="$shapeId" ');

    buffer.write('width="$width" height="$height"');
    
    if (radiusX != null && radiusY != null) {
      buffer.write(' rx="$radiusX" ry="$radiusY"');
    }
    
    buffer.write(' />\n');
    
    return buffer.toString();
  }
}
