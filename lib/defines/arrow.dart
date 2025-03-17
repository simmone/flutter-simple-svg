import 'shape.dart';

class Arrow implements Shape {
  num startX;
  num startY;
  num endX;
  num endY;
  num handleBase;
  num headBase;
  num headHeight;

  Arrow(this.startX, this.startY, this.endX, this.endY, this.handleBase, this.headBase, this.headHeight);

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    return buffer.toString();
  }
}
