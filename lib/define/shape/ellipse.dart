import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

class Ellipse implements Shape {
  final num radiusX;
  final num radiusY;

  Ellipse(this.radiusX, this.radiusY);

  @override
  String unique() {
    return 'Ellipse/radiusX/$radiusX/radiusY/$radiusY';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
        '    <ellipse id="$shapeId" rx="${Tool.round(radiusX)}" ry="${Tool.round(radiusY)}" />\n');

    return buffer.toString();
  }
}
