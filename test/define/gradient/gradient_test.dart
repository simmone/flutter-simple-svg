import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/gradient.dart';

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

    final file = File('test/define/gradient/linear_gradient_define.svg');
    final linearDefineFile = await file.readAsString();

    expect(gradient.format('s1'), linearDefineFile);
  });

  test('radial gradient format', () async {
    final gradient = RadialGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]);

    gradient.cx = 0;
    gradient.cy = 1;
    gradient.fx = 2;
    gradient.fy = 3;
    gradient.r = 4;
    gradient.gradientUnits = GradientUnits.userSpaceOnUse;
    gradient.spreadMethod = SpreadMethod.repeat;

    final file = File('test/define/gradient/radial_gradient_define.svg');
    final radialDefineFile = await file.readAsString();

    expect(gradient.format('s1'), radialDefineFile);
  });
}
