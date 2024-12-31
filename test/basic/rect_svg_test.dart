import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic rect svg out', () async {
    final svg = SimpleSvg(100, 100);

    final rect = Rect(100.0, 100.0);
    svg.defShape(rect);

    var defaultGroup = Group();
    defaultGroup.placeWidget(Widget("s1"));

    final file = File('showcase/shapes/rect/rect.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
