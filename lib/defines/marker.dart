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

    buffer.write('    <marker ');

    buffer.write(() {
      var options = <String>[];

      options.add('id="$shapeId"');

      if (dx != null) {
        options.add('dx="$dx"');
      }

      if (dy != null) {
        options.add('dy="$dy"');
      }

      if (fontSize != null) {
        options.add('font-size="$fontSize"');
      }

      if (fontFamily != null) {
        options.add('font-family="$fontFamily"');
      }

      if (rotate != null) {
        options.add(() {
          var rotateBuffer = StringBuffer();

          rotateBuffer.write('rotate="');
          rotateBuffer.write(() {
            var rotateItems = <String>[];

            for (final item in rotate!) {
              rotateItems.add('$item');
            }

            return rotateItems.join(' ');
          }());
          rotateBuffer.write('"');

          return rotateBuffer.toString();
        }());
      }

      if (markerLength != null) {
        options.add('markerLength="$markerLength"');
      }

      if (kerning != null) {
        options.add('kerning="${kerning!.formatted()}"');
      }

      if (letterSpace != null) {
        options.add('letter-space="${letterSpace!.formatted()}"');
      }

      if (wordSpace != null) {
        options.add('word-space="${wordSpace!.formatted()}"');
      }

      if (markerDecoration != null) {
        options.add('marker-decoration="${markerDecoration!.name}"');
      }

      return options.join(' ');
    }());

    buffer.write('>');

    if (path != null) {
      buffer.write('\n      <markerPath ');

      var options = <String>[];

      options.add('xlink:href="#$path"');

      if (pathStartOffset != null) {
        options.add('startOffset="$pathStartOffset%"');
      }

      buffer.write(options.join(' '));

      buffer.write('>$marker</markerPath>\n    ');
    } else {
      buffer.write(marker);
    }

    buffer.write('</marker>\n');

    return buffer.toString();
  }
}
