import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic rect svg out', () async {
    final svg = Svg(100, 100);

    final rect = Rect(100, 100);
    svg.defShape(rect);

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget('s1');
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/shapes/rect/rect.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
