import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/svg.dart';
import 'package:simple_svg/defines/rect.dart';

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
  });
}
