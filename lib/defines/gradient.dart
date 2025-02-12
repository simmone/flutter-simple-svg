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

class Gradient implements Shape {
  List<(num, String, num) stops;
  num? x1;
  num? y1;
  num? x2;
  num? y2
  GradientUnits? gradientUnits;
  SpreadMethod? spreadMethod;

  Gradient(this.stops);

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <gradient id="$shapeId">\n');
    buffer.write(
        '      <feGaussianBlur in="SourceAlpha" stdDeviation="$blur"></feGaussianBlur>\n');
    buffer.write(
        '      <feOffset dx="$dropdownOffset" dy="$dropdownOffset" result="offsetblur"></feOffset>\n');
    buffer.write('      <feFlood flood-color="$dropdownColor"></feFlood>\n');
    buffer.write(
        '      <feComposite in2="offsetblur" operator="in"></feComposite>\n');
    buffer.write('      <feMerge>\n');
    buffer.write('        <feMergeNode></feMergeNode>\n');
    buffer.write('        <feMergeNode in="SourceGraphic"></feMergeNode>\n');
    buffer.write('      </feMerge>\n');
    buffer.write('    </gradient>\n');

    return buffer.toString();
  }
}
