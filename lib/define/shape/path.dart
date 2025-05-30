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

abstract class PathAction {
  String format();
}

class PathArcAbs extends PathAction {
  (num, num) point;
  (num, num) radius;
  ArcDirection section;
  
  PathArcAbs(point, radius, section);
  
  @override
  String format() {
    return 'A${Tool.round(radius.$1, this.precision!)},${Tool.round(radius.$2, this.precision!)} 0 ${section.name} ${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathArcRel extends PathAction {
  (num, num) point;
  (num, num) radius;
  ArcDirection section;
  
  PathArcRel(point, radius, section);
  
  @override
  String format() {
    return 'a${Tool.round(radius.$1, this.precision!)},${Tool.round(radius.$2, this.precision!)} 0 ${section.name} ${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathMoveToAbs extends PathAction {
  (num, num) point;
  
  PathMoveToAbs(point);
  
  @override
  String format() {
    return 'M${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathMoveToRel extends PathAction {
  (num, num) point;
  
  PathMoveToRel(point);
  
  @override
  String format() {
    return 'm${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class Path extends Shape {
  List<PathAction> actions = [];

  Path();

  void arcAbs((num, num) point, (num, num) radius, ArcDirection section) {
    actions.add(PathArcAbs(point, radius, section));
  }

  void arcRel((num, num) point, (num, num) radius, ArcDirection section) {
    actions.add(PathArcRel(point, radius, section));
  }

  void movetoAbs((num, num) point) {
    actions.add(PathMoveToAbs(point));
  }

  void movetoRel((num, num) point) {
    actions.add(PathMoveToRel(point));
  }

  void linetoAbs((num, num) point) {
    defs.add('L${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}');
  }

  void linetoRel((num, num) point) {
    defs.add('l${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}');
  }

  void linetoHor(num length) {
    defs.add('h${Tool.round(length, this.precision!)}');
  }

  void linetoVer(num length) {
    defs.add('v${Tool.round(length, this.precision!)}');
  }

  void ccurveAbs((num, num) point1, (num, num) point2, (num, num) point3) {
    defs.add(
        'C${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)} ${Tool.round(point3.$1, this.precision!)},${Tool.round(point3.$2, this.precision!)}');
  }

  void ccurveRel((num, num) point1, (num, num) point2, (num, num) point3) {
    defs.add(
        'c${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)} ${Tool.round(point3.$1, this.precision!)},${Tool.round(point3.$2, this.precision!)}');
  }

  void qcurveAbs((num, num) point1, (num, num) point2) {
    defs.add(
        'Q${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)}');
  }

  void qcurveRel((num, num) point1, (num, num) point2) {
    defs.add(
        'q${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)}');
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
