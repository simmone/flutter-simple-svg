import 'shape.dart';

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
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <linearGradient id="$shapeId" ');

    final outItems = <String>[];

    if (x1 != null) {
      outItems.add('x1="$x1"');
    }

    if (y1 != null) {
      outItems.add('y1="$y1"');
    }

    if (x2 != null) {
      outItems.add('x2="$x2"');
    }

    if (y2 != null) {
      outItems.add('y2="$y2"');
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
      buffer.write('      <stop offset="${stop.$1}%" stop-color="${stop.$2}" ');

      if (stop.$3 != 1.0) {
        buffer.write('stop-opacity="${stop.$3}" ');
      }

      buffer.write('/>\n');
    }

    buffer.write('    </linearGradient>\n');

    return buffer.toString();
  }
}
