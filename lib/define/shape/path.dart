import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

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
        return '1,1';
      case ArcDirection.rightSmall:
        return '0,1';
    }
  }
}

class Path implements Shape {
  List<String> defs = [];

  Path();

  void arcAbs((num, num) point, (num, num) radius, ArcDirection section) {
    defs.add(
        'A${Tool.round(radius.$1)},${Tool.round(radius.$2)} 0 ${section.name} ${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void arcRel((num, num) point, (num, num) radius, ArcDirection section) {
    defs.add(
        'a${Tool.round(radius.$1)},${Tool.round(radius.$2)} 0 ${section.name} ${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void movetoAbs((num, num) point) {
    defs.add('M${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void movetoRel((num, num) point) {
    defs.add('m${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void linetoAbs((num, num) point) {
    defs.add('L${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void linetoRel((num, num) point) {
    defs.add('l${Tool.round(point.$1)},${Tool.round(point.$2)}');
  }

  void linetoHor(num length) {
    defs.add('h${Tool.round(length)}');
  }

  void linetoVer(num length) {
    defs.add('v${Tool.round(length)}');
  }

  void ccurveAbs((num, num) point1, (num, num) point2, (num, num) point3) {
    defs.add(
        'C${Tool.round(point1.$1)},${Tool.round(point1.$2)} ${Tool.round(point2.$1)},${Tool.round(point2.$2)} ${Tool.round(point3.$1)},${Tool.round(point3.$2)}');
  }

  void ccurveRel((num, num) point1, (num, num) point2, (num, num) point3) {
    defs.add(
        'c${Tool.round(point1.$1)},${Tool.round(point1.$2)} ${Tool.round(point2.$1)},${Tool.round(point2.$2)} ${Tool.round(point3.$1)},${Tool.round(point3.$2)}');
  }

  void qcurveAbs((num, num) point1, (num, num) point2) {
    defs.add(
        'Q${Tool.round(point1.$1)},${Tool.round(point1.$2)} ${Tool.round(point2.$1)},${Tool.round(point2.$2)}');
  }

  void qcurveRel((num, num) point1, (num, num) point2) {
    defs.add(
        'q${Tool.round(point1.$1)},${Tool.round(point1.$2)} ${Tool.round(point2.$1)},${Tool.round(point2.$2)}');
  }

  void raw(String rawStr) {
    defs.add(rawStr);
  }

  void close() {
    defs.add('z');
  }

  @override
  String unique() {
    return 'Path/defs/$defs';
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
