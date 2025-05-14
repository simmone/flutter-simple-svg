import 'package:flutter_test/flutter_test.dart';

import 'package:simple_svg/simple_svg.dart';
import 'package:simple_svg/tool.dart';

void main() {
  test('roundTo', () {
    expect(Tool.roundTo(30.0, 4), '30');
    expect(Tool.roundTo(30.0000, 4), '30');
    expect(Tool.roundTo(30, 4), '30');
    expect(Tool.roundTo(30.123, 4), '30.123');
    expect(Tool.roundTo(30.1234, 4), '30.1234');
    expect(Tool.roundTo(30.12344, 4), '30.1234');
    expect(Tool.roundTo(30.12345, 4), '30.1235');
  });
}
