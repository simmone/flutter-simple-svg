import 'package:simple_svg/define/shape.dart';
import 'package:simple_svg/tool.dart';

enum GradientUnits {
  userSpaceOnUse,
  objectBoundingBox,
}

extension GradientUnitsExtension on GradientUnits {
  String get name {
    switch (this) {
      case GradientUnits.userSpaceOnUse:
        return 'userSpaceOnUse';
      case GradientUnits.objectBoundingBox:
        return 'objectBoundingBox';
    }
  }
}

enum SpreadMethod {
  repeat,
  reflect,
}

extension SpreadMethodExtension on SpreadMethod {
  String get name {
    switch (this) {
      case SpreadMethod.repeat:
        return 'repeat';
      case SpreadMethod.reflect:
        return 'reflect';
    }
  }
}

class LinearGradient implements Shape {
  List<(num, String, num)> stops;
  num? x1;
  num? y1;
  num? x2;
  num? y2;
  GradientUnits? gradientUnits;
  SpreadMethod? spreadMethod;

  LinearGradient(this.stops);

  @override
  String unique() {
    return 'LinearGradient/stops/$stops/x1/$x1/y1/$y1/x2/$x2/y2/$y2/gradientUnits/$gradientUnits/spreadMethod/$spreadMethod';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <linearGradient id="$shapeId" ');

    final outItems = <String>[];

    if (x1 != null) {
      outItems.add('x1="${Tool.round(x1!)}"');
    }

    if (y1 != null) {
      outItems.add('y1="${Tool.round(y1!)}"');
    }

    if (x2 != null) {
      outItems.add('x2="${Tool.round(x2!)}"');
    }

    if (y2 != null) {
      outItems.add('y2="${Tool.round(y2!)}"');
    }

    if (gradientUnits != null) {
      outItems.add('gradientUnits="${gradientUnits!.name}"');
    }

    if (spreadMethod != null) {
      outItems.add('spreadMethod="${spreadMethod!.name}"');
    }

    buffer.write(outItems.join(' '));

    buffer.write('>\n');

    for (final stop in stops) {
      buffer.write('      <stop offset="${Tool.round(stop.$1)}%" stop-color="${stop.$2}" ');

      if (stop.$3 != 1.0) {
        buffer.write('stop-opacity="${Tool.round(stop.$3)}" ');
      }

      buffer.write('/>\n');
    }

    buffer.write('    </linearGradient>\n');

    return buffer.toString();
  }
}

class RadialGradient implements Shape {
  List<(num, String, num)> stops;
  num? cx;
  num? cy;
  num? fx;
  num? fy;
  num? r;
  GradientUnits? gradientUnits;
  SpreadMethod? spreadMethod;

  RadialGradient(this.stops);

  @override
  String unique() {
    return 'RadialGradient/stops/$stops/cx/$cx/cy/$cy/fx/$fx/fy/$fy/r/$r';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <radialGradient id="$shapeId" ');

    final outItems = <String>[];

    if (cx != null) {
      outItems.add('cx="${Tool.round(cx!)}"');
    }

    if (cy != null) {
      outItems.add('cy="${Tool.round(cy!)}"');
    }

    if (fx != null) {
      outItems.add('fx="${Tool.round(fx!)}"');
    }

    if (fy != null) {
      outItems.add('fy="${Tool.round(fy!)}"');
    }

    if (r != null) {
      outItems.add('r="${Tool.round(r!)}"');
    }

    if (gradientUnits != null) {
      outItems.add('gradientUnits="${gradientUnits!.name}"');
    }

    if (spreadMethod != null) {
      outItems.add('spreadMethod="${spreadMethod!.name}"');
    }

    buffer.write(outItems.join(' '));

    buffer.write('>\n');

    for (final stop in stops) {
      buffer.write('      <stop offset="${Tool.round(stop.$1)}%" stop-color="${stop.$2}" ');

      if (stop.$3 != 1.0) {
        buffer.write('stop-opacity="${Tool.round(stop.$3)}" ');
      }

      buffer.write('/>\n');
    }

    buffer.write('    </radialGradient>\n');

    return buffer.toString();
  }
}
