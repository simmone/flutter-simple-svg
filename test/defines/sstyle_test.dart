import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/sstyle.dart';

void main() {
  test('sstyle', () {
    final sstyle = Sstyle();
    expect(sstyle.fill, null);
  });
}
