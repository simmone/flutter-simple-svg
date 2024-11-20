import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/rect.dart';

void main() {
  test('rect', () {
    final rect = Rect(30.0, 20.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radius_x, null);
    expect(rect.radius_y, null);
  });

  test('rect_optional1', () {
    final rect = Rect(30.0, 20.0, 10.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radius_x, 10.0);
    expect(rect.radius_y, null);
  });

  test('rect_optional2', () {
    final rect = Rect(30.0, 20.0, 10.0, 5.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radius_x, 10.0);
    expect(rect.radius_y, 5.0);
  });

}
