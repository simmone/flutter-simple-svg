import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/widget.dart';
import 'package:simple_svg/defines/sstyle.dart';

void main() {
  test('widget', () {
    final widget = Widget('s1');
    expect(widget.shapeId, 's1');
    expect(widget.sstyle, null);
  });

  test('format basic', () {
    final widget = Widget('s1');
    expect(widget.format(), '<use xlink:href="#s1" />');
  });

  test('format fill', () {
    var sstyle = Sstyle();
    sstyle.fill = '#BBC42A';

    var widget = Widget('s1');
    widget.sstyle = sstyle;

    expect(widget.format(), "<use xlink:href=\"#s1\" fill=\"#BBC42A\" />");
  });
}
