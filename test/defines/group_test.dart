import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/group.dart';

void main() {
  test('group', () {
    final group = Group();
    expect(group.widgetList.length, 0);
  });
}
