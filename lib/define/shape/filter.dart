import 'shape.dart';

class Filter implements Shape {
  num? blur;
  num? dropdownOffset;
  String? dropdownColor;

  Filter() {
    blur = 2;
    dropdownOffset = 3;
    dropdownColor = 'black';
  }

  @override
  String format(String shapeId) {
    final buffer = StringBuffer();

    buffer.write('    <filter id="$shapeId">\n');
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
    buffer.write('    </filter>\n');

    return buffer.toString();
  }
}
