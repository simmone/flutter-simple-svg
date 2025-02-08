import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/filter.dart';

void main() {
  test('filter', () {
    final filter = Filter();
    expect(filter.blur, 2);
    expect(filter.dropdownOffset, 3);
    expect(filter.dropdownColor, 'black');
  });

  test('filter format', () {
    final filter = Filter();

    expect(filter.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <filter id="1">\n');
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
      buffer.write('    </filter>\n');

      return buffer.toString();
    }());
  });
}
