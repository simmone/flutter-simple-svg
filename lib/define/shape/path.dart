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

abstract interface class PathAction {
  String format();
}

class PathArcAbs extends PathAction width Precision {
  (num, num)? point;
  (num, num)? radius;
  ArcDirection? section;
  
  PathArcAbs(point, radius, section);
  
  @override
  String format() {
    return 'A${Tool.round(radius!.$1, this.precision!)},${Tool.round(radius!.$2, this.precision!)} 0 ${section!.name} ${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathArcRel extends PathAction width Precision {
  (num, num)? point;
  (num, num)? radius;
  ArcDirection? section;
  
  PathArcRel(point, radius, section);
  
  @override
  String format() {
    return 'a${Tool.round(radius!.$1, this.precision!)},${Tool.round(radius!.$2, this.precision!)} 0 ${section!.name} ${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathMoveToAbs extends PathAction width Precision {
  (num, num)? point;
  
  PathMoveToAbs(point);
  
  @override
  String format() {
    return 'M${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathMoveToRel extends PathAction width Precision {
  (num, num)? point;
  
  PathMoveToRel(point);
  
  @override
  String format() {
    return 'm${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathLineToAbs extends PathAction width Precision {
  (num, num)? point;
  
  PathLineToAbs(point);
  
  @override
  String format() {
    return 'L${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathLineToRel extends PathAction width Precision {
  (num, num)? point;
  
  PathLineToRel(point);
  
  @override
  String format() {
    return 'l${Tool.round(point!.$1, this.precision!)},${Tool.round(point!.$2, this.precision!)}';
  }
}

class PathLineToHor extends PathAction width Precision {
  num? length;
  
  PathLineToHor(point);
  
  @override
  String format() {
    return 'h${Tool.round(length!, this.precision!)}';
  }
}

class PathLineToVer extends PathAction width Precision {
  num? length;
  
  PathLineToVer(point);
  
  @override
  String format() {
    return 'h${Tool.round(length!, this.precision!)}';
  }
}

class PathCcurveAbs extends PathAction width Precision {
  (num, num)? point1;
  (num, num)? point2;
  (num, num)? point3;
  
  PathCcurveAbs(point1, point2, point3);
  
  @override
  String format() {
    return 'C${Tool.round(point1!.$1, this.precision!)},${Tool.round(point1!.$2, this.precision!)} ${Tool.round(point2!.$1, this.precision!)},${Tool.round(point2!.$2, this.precision!)} ${Tool.round(point3!.$1, this.precision!)},${Tool.round(point3!.$2, this.precision!)}';
  }
}

class PathCcurveRel extends PathAction width Precision {
  (num, num)? point1;
  (num, num)? point2;
  (num, num)? point3;
  
  PathCcurveRel(point1, point2, point3);
  
  @override
  String format() {
    return 'c${Tool.round(point1!.$1, this.precision!)},${Tool.round(point1!.$2, this.precision!)} ${Tool.round(point2!.$1, this.precision!)},${Tool.round(point2!.$2, this.precision!)} ${Tool.round(point3!.$1, this.precision!)},${Tool.round(point3!.$2, this.precision!)}';
  }
}

class PathQcurveAbs extends PathAction width Precision {
  (num, num)? point1;
  (num, num)? point2;
  
  PathQcurveAbs(point1, point2);
  
  @override
  String format() {
    return 'Q${Tool.round(point1!.$1, this.precision!)},${Tool.round(point1!.$2, this.precision!)} ${Tool.round(point2!.$1, this.precision!)},${Tool.round(point2!.$2, this.precision!)}';
  }
}

class PathQcurveRel implement PathAction width Precision {
  (num, num) point1;
  (num, num) point2;
  
  PathQcurveRel(this.point1, this.point2);
  
  @override
  String format() {
    return 'q${Tool.round(point1.$1, this.precision!)},${Tool.round(point1.$2, this.precision!)} ${Tool.round(point2.$1, this.precision!)},${Tool.round(point2.$2, this.precision!)}';
  }
}

class PathRaw extends PathAction {
  String? raw;
  
  PathRaw(raw);
  
  @override
  String format() {
    return raw!;
  }
}

class PathClose extends PathAction {
  PathClose();
  
  @override
  String format() {
    return 'z';
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
