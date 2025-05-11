import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/recursive.dart';

void main() {
  test('recursive circles', () {
    final svg = Svg(100, 100);

    final rectId = svg.defShape(Rect(100, 100));

    var defaultGroup = Group();

    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    defaultGroup.placeWidget(widget);
    svg.addDefaultGroup(defaultGroup);

    final file = File('showcase/examples/recursive.svg');
    final rectSvgFile = await file.readAsString();

    expect(svg.out(), rectSvgFile);
  });
}
