import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/gradient.dart';

void main() {
  test('linear gradient format', () async {
    final gradient = LinearGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]);

    gradient.x1 = 0;
    gradient.y1 = 1;
    gradient.x2 = 2;
    gradient.y2 = 3;
    gradient.gradientUnits = GradientUnits.userSpaceOnUse;
    gradient.spreadMethod = SpreadMethod.repeat;

    final file = File('test/defines/gradient/linear_gradient_define.svg');
    final linearDefineFile = await file.readAsString();

    expect(gradient.format('s1'), linearDefineFile);
  });
}
