import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('text basic', () async {
    final svg = Svg(310, 70);

    final text = Text('城春草木深');
    text.fontSize = 50;

    final textId = svg.defShape(text);

    var defaultGroup = Group();

    var textSstyle = Sstyle();
    textSstyle.fill = '#ED6E46';

    var widget = Widget(textId);
    widget.sstyle = textSstyle;
    widget.at = (30, 50);

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/text/text1.svg');
    final textSvgFile = await file.readAsString();

    expect(svg.out(), textSvgFile);
  });

  test('text rotate', () async {
    final svg = Svg(350, 120);

    final text = Text('城春草木深');
    text.fontSize = 50;
    text.rotate = [10, 20, 30, 40, 50];
    text.textLength = 300;

    final textId = svg.defShape(text);

    var defaultGroup = Group();

    var textSstyle = Sstyle();
    textSstyle.fill = '#ED6E46';

    var widget = Widget(textId);
    widget.sstyle = textSstyle;
    widget.at = (30, 60);

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/text/text2.svg');
    final textSvgFile = await file.readAsString();

    expect(svg.out(), textSvgFile);
  });

  test('text decoration', () async {
    final svg = Svg(310, 280);

    final text1 = Text('国破山河在');
    text1.fontSize = 50;
    text1.textDecoration = TextDecoration.overLine;
    final text1Id = svg.defShape(text1);

    final text2 = Text('国破山河在');
    text2.fontSize = 50;
    text2.textDecoration = TextDecoration.underLine;
    final text2Id = svg.defShape(text2);

    final text3 = Text('国破山河在');
    text3.fontSize = 50;
    text3.textDecoration = TextDecoration.lineThrough;
    final text3Id = svg.defShape(text3);

    var defaultGroup = Group();

    var textSstyle = Sstyle();
    textSstyle.fill = '#ED6E46';

    var widget1 = Widget(text1Id);
    widget1.sstyle = textSstyle;
    widget1.at = (30, 60);
    defaultGroup.placeWidget(widget1);

    var widget2 = Widget(text2Id);
    widget2.sstyle = textSstyle;
    widget2.at = (30, 160);
    defaultGroup.placeWidget(widget2);

    var widget3 = Widget(text3Id);
    widget3.sstyle = textSstyle;
    widget3.at = (30, 260);
    defaultGroup.placeWidget(widget3);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/text/text3.svg');
    final textSvgFile = await file.readAsString();

    expect(svg.out(), textSvgFile);
  });

  test('text path', () async {
    final svg = Svg(500, 100);

    final qcurvePath = Path();
    qcurvePath.movetoAbs((10, 60));
    qcurvePath.qcurveAbs((110, 10), (210, 60));
    qcurvePath.qcurveAbs((310, 110), (410, 60));
    final qcurveId = svg.defShape(qcurvePath);

    final text = Text('国破山河在 城春草木深 感时花溅泪 恨别鸟惊心');
    text.path = qcurveId;
    text.pathStartOffset = 5;
    final textId = svg.defShape(text);

    var defaultGroup = Group();

    var textSstyle = Sstyle();
    textSstyle.fill = '#ED6E46';

    var widget = Widget(textId);
    widget.sstyle = textSstyle;

    defaultGroup.placeWidget(widget);

    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/text/text4.svg');
    final textSvgFile = await file.readAsString();

    expect(svg.out(), textSvgFile);
  });
}
