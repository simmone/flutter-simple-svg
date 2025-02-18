import 'shape.dart';

enum ArcDirection {
  leftBig,
  leftSmall,
  rightBig,
  rightSmall,
}

extension ArcDirectionExtension on ArcDirection {
  String get name {
    switch (this) {
      case ArcDirection.leftBig:
        return '1,0';
      case ArcDirection.leftSmall:
        return '0,0';
      case ArcDirection.rightBig:
        return '1,0';
      case ArcDirection.rightSmall:
        return '0,0';
    }
  }
}

class Path implements Shape {
  List<String> defs = [];

  Path();
  
  void arcAbs((num?, num?) point, (num?, num?) radius, ArcDirection section) {
    defs.add('A${radius.$1},${radius.$2} 0 $section ${point.$1},${point.$2}');
  }

  void arcRel((num?, num?) point, (num?, num?) radius, ArcDirection section) {
    defs.add('a${radius.$1},${radius.$2} 0 $section ${point.$1},${point.$2}');
  }

  void movetoAbs((num?, num?) point) {
    defs.add('M${point.$1},${point.$2}');
  }

  void movetoRel((num?, num?) point) {
    defs.add('m${point.$1},${point.$2}');
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <path id="$shapeId"\n');
    buffer.write('          d="\n');
    for (final def in defs) {
      buffer.write('             $def\n');
    }
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
