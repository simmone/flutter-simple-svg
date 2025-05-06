import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/group.dart';
import 'package:simple_svg/define/widget.dart';

void main() {
  test('group', () {
    final group = Group();
    expect(group.widgetList.length, 0);

    group.placeWidget(Widget("s1"));
    expect(group.widgetList.length, 1);
  });
}
