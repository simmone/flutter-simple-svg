import 'package:simple_svg/define/shape.dart';

class Line implements Shape {
  num startX = 0;
  num startY = 0;
  num endX = 0;
  num endY = 0;

  Line((num, num) startPoint, (num, num) endPoint) {
    startX = startPoint.$1;
    startY = startPoint.$2;
    endX = endPoint.$1;
    endY = endPoint.$2;
  }
  
  @override
  String unique() {
    return 'Line/startX/$startX/startY/$startY/endX/$endX/endY/$endY';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write(
        '    <line id="$shapeId" x1="$startX" y1="$startY" x2="$endX" y2="$endY" />\n');

    return buffer.toString();
  }
}
