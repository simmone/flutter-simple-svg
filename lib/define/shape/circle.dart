import 'shape.dart';

class Circle implements Shape {
  final num radius;

  Circle(this.radius);

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <circle id="$shapeId" r="$radius" />\n');

    return buffer.toString();
  }
}
