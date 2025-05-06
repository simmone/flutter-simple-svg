import 'package:simple_svg/define/shape.dart';

enum MarkerType {
  triangle1,
  triangle2,
  circle,
  indent1,
  indent2,
  diamond1,
  diamond2,
  curve1,
  curve2,
}

class Marker implements Shape {
  MarkerType shape;
  num size = 0;
  num x = 0;
  String path = '';
  
  Marker(this.shape) {
    switch(this.shape) {
      case MarkerType.triangle1: this.size = 6; this.x = 1; this.path = '<path d="M0,0 L10,5 L0,10 z"';
      case MarkerType.triangle2: this.size = 6; this.x = 1; this.path = '<path d="M0,0 L15,5 L0,10 z"';
      case MarkerType.circle: this.size = 6; this.x = 5; this.path = '<circle r="5" cx="5" cy="5"';
      case MarkerType.indent1: this.size = 6; this.x = 4; this.path = '<path d="M0,0 L10,5 L0,10 L5,5 z"';
      case MarkerType.indent2: this.size = 6; this.x = 4; this.path = '<path d="M0,0 L15,5 L0,10 L5,5 z"';
      case MarkerType.diamond1: this.size = 6; this.x = 1; this.path = '<path d="M3,0 L10,5 L3,10 L0,5 z"';
      case MarkerType.diamond2: this.size = 6; this.x = 1; this.path = '<path d="M3,0 L15,5 L3,10 L0,5 z"';
      case MarkerType.curve1: this.size = 6; this.x = 2; this.path = '<path d="M0,0 L10,5 L0,10 C0,10 5,5 0,0 z"';
      case MarkerType.curve2: this.size = 6; this.x = 2; this.path = '<path d="M0,0 L15,5 L0,10 C0,10 5,5 0,0 z"';
    };
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <marker id="$shapeId" markerWidth="$size" markerHeight="$size" orient="auto-start-reverse" viewBox="0 0 15 15" refX="$x" refY="5" markerUnits="strokeWidth">\n');
    buffer.write('      $path fill="context-stroke" />\n');
    buffer.write('    </marker>\n');

    return buffer.toString();
  }
}
