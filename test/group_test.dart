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

  test('group pattern', () async {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(50, 50));
    final line1Id = svg.defShape(Line((10, 0), (0, 50)));
    final line2Id = svg.defShape(Line((0, 0), (10, 50)));

    var lineSstyle = Sstyle();
    lineSstyle.stroke = 'black';
    lineSstyle.strokeWidth = 1;

    var crossLineGroup = Group();

    var widgetLine1 = Widget(line1Id);
    widgetLine1.sstyle = lineSstyle;
    crossLineGroup.placeWidget(widgetLine1);

    var widgetLine2 = Widget(line2Id);
    widgetLine2.sstyle = lineSstyle;
    crossLineGroup.placeWidget(widgetLine2);

    final crossLineGroupId = svg.addGroup(crossLineGroup);

    var patternGroup = Group();

    var rectSstyle = Sstyle();
    rectSstyle.fill = 'orange';
    rectSstyle.stroke = 'red';
    rectSstyle.strokeWidth = 2;

    var widgetRect = Widget(rectId);
    widgetRect.sstyle = rectSstyle;
    
    patternGroup.placeWidget(widgetRect);
    
    var crossLineWidget1 = Widget(crossLineGroupId);
    crossLineWidget1.at = (0, 0);
    patternGroup.placeWidget(crossLineWidget1);

    var crossLineWidget2 = Widget(crossLineGroupId);
    crossLineWidget2.at = (10, 0);
    patternGroup.placeWidget(crossLineWidget2);

    var crossLineWidget3 = Widget(crossLineGroupId);
    crossLineWidget3.at = (20, 0);
    patternGroup.placeWidget(crossLineWidget3);

    var crossLineWidget4 = Widget(crossLineGroupId);
    crossLineWidget4.at = (30, 0);
    patternGroup.placeWidget(crossLineWidget4);

    var crossLineWidget5 = Widget(crossLineGroupId);
    crossLineWidget5.at = (40, 0);
    patternGroup.placeWidget(crossLineWidget5);
    
    final patternGroupId = svg.addGroup(patternGroup);
    
    var defaultGroup = Group();
    
    var patternWidget1 = Widget(patternGroupId);
    patternWidget1.at = (0, 0);
    defaultGroup.placeWidget(patternWidget1);

    var patternWidget2 = Widget(patternGroupId);
    patternWidget2.at = (50, 0);
    defaultGroup.placeWidget(patternWidget2);

    var patternWidget3 = Widget(patternGroupId);
    patternWidget3.at = (0, 50);
    defaultGroup.placeWidget(patternWidget3);

    var patternWidget4 = Widget(patternGroupId);
    patternWidget4.at = (50, 50);
    defaultGroup.placeWidget(patternWidget4);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/group/group2.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
