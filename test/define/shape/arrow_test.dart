import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('arrow 1', () async {
    final svg = Svg(300, 300);

    final arrowId = svg.defShape(Arrow(50, 50, 280, 280, 40, 40, 80));

    var arrowSstyle = Sstyle();
    arrowSstyle.stroke = 'teal';
    arrowSstyle.fill = 'lavender';
    arrowSstyle.strokeWidth = 5;

    var defaultGroup = Group();

    var widget = Widget(arrowId);
    widget.sstyle = arrowSstyle;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/arrow/arrow1.svg');
    final arrowSvgFile = await file.readAsString();
    
    expect(svg.out(), arrowSvgFile);
  });
}
