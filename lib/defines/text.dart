import 'shape.dart';

class TextKerningC {
  String type;
  num? val;
  
  TextKerningC.optional(this.type, [this.val = 0]);
  
  String formatted() {
    switch (this.type) {
      case TextKerning.number:
        return '$this.number';
      default:
        return this.type;
    }
  }
}

enum TextSpace {
  number,
  normal,
  inherit,
}

extension TextSpaceExtension on TextSpace {
  String get name {
    switch (this) {
      case TextSpace.number(num n):
        return '$n';
      case TextSpace.normal:
        return 'normal';
      case TextSpace.inherit:
        return 'inerit';
    }
  }
}

enum TextDecoration {
  overLine
  underLine,
  lineThrough,
}

extension TextDecorationExtension on TextDecoration {
  String get name {
    switch (this) {
      case TextDecoration.overLine:
        return 'overline';
      case TextDecoration.underLine:
        return 'underline';
      case TextDecoration.lineThrough:
        return 'line-through';
    }
  }
}

class Text implements Shape {
  String text;
  num? fontSize;
  String? fontFamily;
  num? dx;
  num? dy;
  List<num>? rotate;
  num? textLength;
  TextKerningC? kerning;
  TextSpace? letterSpace;
  TextSpace? wordSpace;
  TextDecoration? textDecoration;
  String? path;
  num? pathStartOffset;

  Text(this.text);

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <text id="$shapeId"\n');
    buffer.write('          d="\n');
    for (final def in defs) {
      buffer.write('             $def\n');
    }
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
