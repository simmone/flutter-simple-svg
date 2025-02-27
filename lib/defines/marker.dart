import 'shape.dart';

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
  num size;
  num x;
  String path;

  Marker(this.marker) {
    switch(this.marker) {
      case MarkerType.triangle1: return Marker(this.marker, 6, 1, '<path d="M0,0 L10,5 L0,10 z"');
      case MarkerType.triangle2: return Marker(this.marker, 6, 1, '<path d="M0,0 L15,5 L0,10 z"');
      case MarkerType.circle: return Marker(this.marker, 6, 5, '<circle r="5" cx="5" cy="5"');
      case MarkerType.indent1: return Marker(this.marker, 6, 4, '<path d="M0,0 L10,5 L0,10 L5,5 z"');
      case MarkerType.indent2: return Marker(this.marker, 6, 4, '<path d="M0,0 L15,5 L0,10 L5,5 z"');
      case MarkerType.diamond1: return Marker(this.marker, 6, 1, '<path d="M3,0 L10,5 L3,10 L0,5 z"');
      case MarkerType.diamond2: return Marker(this.marker, 6, 1, '<path d="M3,0 L15,5 L3,10 L0,5 z"');
      case MarkerType.curve1: return Marker(this.marker, 6, 2, '<path d="M0,0 L10,5 L0,10 C0,10 5,5 0,0 z"');
      case MarkerType.curve2: return Marker(this.marker, 6, 2, '<path d="M0,0 L15,5 L0,10 C0,10 5,5 0,0 z"');
    }
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
