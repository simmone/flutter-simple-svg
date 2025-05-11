import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/recursive.dart';

void main() {
  test('recursive circles', () {
    final svg = Svg(400, 400);

    var sstyle = Sstyle();
    sstyle.stroke = 'red';
    sstyle.stroke_width = 1;

    var defaultGroup = Group();

    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/examples/recursive.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
