import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('marker normal', () async {
    final svg = Svg(200, 120);

    final markerId = svg.defShape(Marker(MarkerType.triangle1));

    final lineId = svg.defShape(Line((0, 0), (100, 0)));

    var lineSstyle = Sstyle();
    lineSstyle.stroke = '#000000';
    lineSstyle.strokeWidth = 2;

    var defaultGroup = Group();

    var widget = Widget(lineId);
    widget.sstyle = lineSstyle;
    widget.at = (50, 50);
    widget.markerEndId = markerId;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/marker/marker1.svg');
    final markerSvgFile = await file.readAsString();

    expect(svg.out(), markerSvgFile);
  });

}
