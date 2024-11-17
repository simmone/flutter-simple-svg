import 'package:flutter_test/flutter_test.dart';

import 'package:simple_svg/defines/svg.dart';

void main() {
  test('svg', () {
    final svg = Svg(30, 20.0);
    expect(svg.width, 30.0);
    expect(svg.height, 20.0);
  });
}
