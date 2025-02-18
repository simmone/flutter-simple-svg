import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('path arc', () async {
    final svg = Svg(300, 130);
    
    var arcPath = Path();
    arcPath.movetoAbs(130, 45);
    arcPath.arcAbs((170, 85), (80, 40), ArcDirection.leftBig);

    final pathId = svg.defShape(Path());

    final circleId = svg.defShape(Circle(50));



    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.stroke = 'red';
    sstyle.strokeWidth = 12;

    var widget = Widget(circleId);
    widget.sstyle = sstyle;
    widget.arcId = arcId;
    widget.at = (70, 70);

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/arc/arc_blur_dropdown.svg');
    final arcSvgFile = await file.readAsString();

    expect(svg.out(), arcSvgFile);
  });
}
