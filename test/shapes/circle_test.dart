import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic circle svg out', () async {
    final svg = Svg(100, 100);

    final circleId = svg.defShape(Circle(50));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(circleId);
    widget.sstyle = sstyle;
    widget.at = (50, 50);

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/circle/circle.svg');
    final circleSvgFile = await file.readAsString();

    expect(svg.out(), circleSvgFile);
  });
}
