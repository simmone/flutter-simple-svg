import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic filter', () async {
    final svg = Svg(140, 140);

    final circleId = svg.defShape(Circle(50));

    final filterId = svg.defShape(Filter());

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.stroke = 'red';
    sstyle.strokeWidth = 12;

    var widget = Widget(circleId);
    widget.sstyle = sstyle;
    widget.filterId = filterId;
    widget.at = (70, 70);

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/filter/filter_blur_dropdown.svg');
    final filterSvgFile = await file.readAsString();

    expect(svg.out(), filterSvgFile);
  });
}
