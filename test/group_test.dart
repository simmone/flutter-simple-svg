import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('group1', () async {
    final svg = Svg(220, 280);

    final line1Id = svg.defShape(Line((0, 0), (30, 30)));
    final line2Id = svg.defShape(Line((0, 15), (30, 15)));
    final line3Id = svg.defShape(Line((15, 0), (15, 30)));
    final line4Id = svg.defShape(Line((30, 0), (0, 30)));

    var starGroup = Group();

    var sstyle = Sstyle();
    sstyle.stroke = '#765373';
    sstyle.strokeWidth = 5;

    var widgetLine1 = Widget(line1Id);
    widgetLine1.sstyle = sstyle;
    widgetLine1.at = (5, 5);

    var widgetLine2 = Widget(line2Id);
    widgetLine2.sstyle = sstyle;
    widgetLine2.at = (5, 5);

    var widgetLine3 = Widget(line3Id);
    widgetLine3.sstyle = sstyle;
    widgetLine3.at = (5, 5);

    var widgetLine4 = Widget(line4Id);
    widgetLine4.sstyle = sstyle;
    widgetLine4.at = (5, 5);

    starGroup.placeWidget(widgetLine1);
    starGroup.placeWidget(widgetLine2);
    starGroup.placeWidget(widgetLine3);
    starGroup.placeWidget(widgetLine4);
    
    final starGroupId = svg.addGroup(starGroup);

    var defaultGroup = Group();
    var widget1 = Widget(starGroupId);
    widget1.at = (50, 50);
    defaultGroup.placeWidget(widget1);

    var widget2 = Widget(starGroupId);
    widget2.at = (100, 100);
    defaultGroup.placeWidget(widget2);

    var widget3 = Widget(starGroupId);
    widget3.at = (80, 200);
    defaultGroup.placeWidget(widget3);

    var widget4 = Widget(starGroupId);
    widget4.at = (150, 100);
    defaultGroup.placeWidget(widget4);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/group/group1.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
