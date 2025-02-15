import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('linear gradient', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    final gradientId = svg.defShape(LinearGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]));

    var rectSstyle = Sstyle();
    rectSstyle.fillGradient = gradientId;

    var defaultGroup = Group();

    var widget = Widget(rectId);
    widget.sstyle = rectSstyle;
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/gradient/linear_gradient.svg');
    final gradientSvgFile = await file.readAsString();

    expect(svg.out(), gradientSvgFile);
  });

  test('radial gradient', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    final gradientId = svg.defShape(RadialGradient([
      (0, '#BBC42A', 1),
      (100, '#ED6E46', 1),
    ]));

    var rectSstyle = Sstyle();
    rectSstyle.fillGradient = gradientId;

    var defaultGroup = Group();

    var widget = Widget(rectId);
    widget.sstyle = rectSstyle;
    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/gradient/radial_gradient.svg');
    final gradientSvgFile = await file.readAsString();

    expect(svg.out(), gradientSvgFile);
  });
}
