import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/group.dart';
import 'package:simple_svg/defines/widget.dart';

void main() {
  test('group', () {
    final group = Group();
    expect(group.widgetList.length, 0);

    group.placeWidget(Widget("s1"));
    expect(group.widgetList.length, 1);
  });
}
