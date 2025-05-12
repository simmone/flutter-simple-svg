import 'package:simple_svg/define/shape.dart';

class Polygon implements Shape {
  List<(num, num)> points;

  Polygon(this.points);
  
  @override

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <polygon id="$shapeId" points="');

    final pointItems = <String>[];

    for (final point in points) {
      pointItems.add('${point.$1},${point.$2}');
    }

    final pointsStr = pointItems.join(' ');

    buffer.write(pointsStr);

    buffer.write('" />\n');

    return buffer.toString();
  }
}
