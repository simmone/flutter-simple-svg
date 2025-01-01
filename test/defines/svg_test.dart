import 'package:flutter_test/flutter_test.dart';

import 'package:simple_svg/defines/svg.dart';
import '../../lib/assets/constants.dart' as Constants;

import 'package:simple_svg/defines/rect.dart';
import 'package:simple_svg/defines/group.dart';

void main() {
  test('svg', () {
    final svg = Svg(30, 20.0);
    expect(svg.width, 30.0);
    expect(svg.height, 20.0);
  });

  test('defShape', () {
    final svg = Svg(30, 20.0);

    final rect1 = Rect(30.0, 20.0);
    svg.defShape(rect1);
    expect(svg.shapeDefineMap.length, 1);

    final rect2 = Rect(30.0, 20.0);
    svg.defShape(rect2);
    expect(svg.shapeDefineMap.length, 2);

    expect(svg.groupDefineMap.length, 0);
    expect(svg.groupShowList.length, 0);
  });
  
  test('addGroup', () {
      var svg = Svg(30, 20);
      expect(svg.groupDefineMap.length, 0);
      var group = Group();
      svg.addGroup(group);
      expect(svg.groupDefineMap.length, 1);
      expect(svg.groupDefineMap.containsKey('g1'), true);
      
      svg.addDefaultGroup(Group());
      expect(svg.groupDefineMap.length, 2);
      expect(svg.groupDefineMap.containsKey(Constants.defaultGroupId), true);
  });
}
