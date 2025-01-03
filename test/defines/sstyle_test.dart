import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/sstyle.dart';

void main() {
  test('sstyle', () {
    final sstyle = Sstyle();
    expect(sstyle.fill, null);
  });

  test('format fill', () {
    var sstyle = Sstyle();
    sstyle.fillRule = FillRule.nonzero;
    sstyle.fillGradient = 's1';
    sstyle.fillOpacity = 0.5;

    expect(sstyle.format(),
        'fill="url(#s1)" fill-rule="nonzero" fill-opacity="0.5"');
  });
}
