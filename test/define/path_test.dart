import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/path.dart';

void main() {
  test('path', () {
    final path = Path();
    expect(path.defs.length, 0);
  });

  test('format path', () {
    var path = Path();
    path.defs.add('path strs');

    expect(path.format('1'), () {
      final buffer = StringBuffer();

      buffer.write('    <path id="1"\n');
      buffer.write('          d="\n');
      buffer.write('             path strs\n');
      buffer.write('            "/>\n');

      return buffer.toString();
    }());
  });
}
