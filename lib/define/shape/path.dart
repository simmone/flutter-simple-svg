import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/define/precision.dart';
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

abstract class PathAction with Precision {
  String format();
}

class PathArcAbs implements PathAction {
  final (num, num) point;
  final (num, num) radius;
  final ArcDirection section;
  
  PathArcAbs(this.point, this.radius, this.section);
  
  @override
  String format() {
    return 'A${Tool.round(radius.$1, this.precision!)},${Tool.round(radius.$2, this.precision!)} 0 ${section.name} ${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathArcRel implements PathAction {
  final (num, num) point;
  final (num, num) radius;
  final ArcDirection section;
  
  PathArcRel(this.point, this.radius, this.section);
  
  @override
  String format() {
    return 'a${Tool.round(radius.$1, this.precision!)},${Tool.round(radius.$2, this.precision!)} 0 ${section.name} ${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathMoveToAbs implements PathAction {
  final (num, num) point;
  
  PathMoveToAbs(this.point);
  
  @override
  String format() {
    return 'M${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathMoveToRel implements PathAction {
  final (num, num) point;
  
  PathMoveToRel(this.point);
  
  @override
  String format() {
    return 'm${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathLineToAbs implements PathAction {
  final (num, num) point;
  
  PathLineToAbs(this.point);
  
  @override
  String format() {
    return 'L${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathLineToRel implements PathAction {
  final (num, num) point;
  
  PathLineToRel(this.point);
  
  @override
  String format() {
    return 'l${Tool.round(point.$1, this.precision!)},${Tool.round(point.$2, this.precision!)}';
  }
}

class PathLineToHor implements PathAction {
  final num length;
  
  PathLineToHor(this.length);
  
  @override
  String format() {
    return 'h${Tool.round(length, this.precision!)}';
  }
}

class PathLineToVer implements PathAction {
  final num length;
  
  PathLineToVer(this.length);
  
  @override
  String format() {
    return 'h${Tool.round(length, this.precision!)}';
  }
}

class PathCcurveAbs implements PathAction {
  final (num, num) point1;
  final (num, num) point2;
  final (num, num) point3;
  
  PathCcurveAbs(this.point1, this.point2, this.point3);
  
  @override
  String format() {
    return 'C${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)} ${Tool.round(point3.$1, this.precision!)},${Tool.round(point3.$2, this.precision!)}';
  }
}

class PathCcurveRel implements PathAction {
  final (num, num) point1;
  final (num, num) point2;
  final (num, num) point3;
  
  PathCcurveRel(this.point1, this.point2, this.point3);
  
  @override
  String format() {
    return 'c${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)} ${Tool.round(point3.$1, this.precision!)},${Tool.round(point3.$2, this.precision!)}';
  }
}

class PathQcurveAbs implements PathAction {
  final (num, num) point1;
  final (num, num) point2;
  
  PathQcurveAbs(this.point1, this.point2);
  
  @override
  String format() {
    return 'Q${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)}';
  }
}

class PathQcurveRel implements PathAction {
  final (num, num) point1;
  final (num, num) point2;
  
  PathQcurveRel(this.point1, this.point2);
  
  @override
  String format() {
    return 'q${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)}';
  }
}

class PathRaw implements PathAction {
  final String raw;
  
  PathRaw(this.raw);
  
  @override
  String format() {
    return raw;
  }
}

class PathClose implements PathAction {
  PathClose();
  
  @override
  String format() {
    return 'z';
  }
}

class Path extends Shape {
  List<PathAction> actions = [];

  Path();
  
  void setAllActionPrecision(int precision) {
    for (final action in actions) {
      action.precision! = precision;
    }
  }

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
    actions.add(PathLineToAbs(point));
  }

  void linetoRel((num, num) point) {
    actions.add(PathLineToRel(point));
  }

  void linetoHor(num length) {
    actions.add(PathLineToHor(length));
  }

  void linetoVer(num length) {
    actions.add(PathLineToVer(length));
  }

  void ccurveAbs((num, num) point1, (num, num) point2, (num, num) point3) {
    actions.add(PathCcurveAbs(point1, point2, point3));
  }

  void ccurveRel((num, num) point1, (num, num) point2, (num, num) point3) {
    actions.add(PathCcurveRel(point1, point2, point3));
  }

  void qcurveAbs((num, num) point1, (num, num) point2) {
    actions.add(PathQcurveAbs(point1, point2));
  }

  void qcurveRel((num, num) point1, (num, num) point2) {
    actions.add(PathQcurveRel(point1, point2));
  }

  void raw(String rawStr) {
    actions.add(PathRaw(rawStr));
  }

  void close() {
    actions.add(PathClose());
  }

  @override
  String unique() {
    return 'Path/defs/$actions';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <path id="$shapeId"\n');
    buffer.write('          d="\n');
    for (final action in actions) {
      buffer.write('             ${action.format()}\n');
    }
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
