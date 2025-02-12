import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/gradient.dart';

void main() {
  test('gradient', () {
    final gradient = Gradient();
    expect(gradient.blur, 2);
    expect(gradient.dropdownOffset, 3);
    expect(gradient.dropdownColor, 'black');
  });

  test('gradient format', () {
    final gradient = Gradient();

    expect(gradient.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <gradient id="1">\n');
      buffer.write(
          '      <feGaussianBlur in="SourceAlpha" stdDeviation="2"></feGaussianBlur>\n');
      buffer.write(
          '      <feOffset dx="3" dy="3" result="offsetblur"></feOffset>\n');
      buffer.write('      <feFlood flood-color="black"></feFlood>\n');
      buffer.write(
          '      <feComposite in2="offsetblur" operator="in"></feComposite>\n');
      buffer.write('      <feMerge>\n');
      buffer.write('        <feMergeNode></feMergeNode>\n');
      buffer.write('        <feMergeNode in="SourceGraphic"></feMergeNode>\n');
      buffer.write('      </feMerge>\n');
      buffer.write('    </gradient>\n');

      return buffer.toString();
    }());
  });
}
