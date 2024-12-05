import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/defines/rect.dart';

void main() {
  test('rect', () {
    final rect = Rect(30.0, 20.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, null);
    expect(rect.radiusY, null);
  });

  test('rect_optional1', () {
    final rect = Rect(30.0, 20.0, 10.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, 10.0);
    expect(rect.radiusY, null);
  });

  test('rect_optional2', () {
    final rect = Rect(30.0, 20.0, 10.0, 5.0);
    expect(rect.width, 30.0);
    expect(rect.height, 20.0);
    expect(rect.radiusX, 10.0);
    expect(rect.radiusY, 5.0);
  });

  test('format1', () {
    final rect = Rect(30, 20);

    expect(
        rect.format('1'), "    <rect id=\"1\" width=\"30\" height=\"20\" />\n");
  });

  test('format2', () {
    final rect = Rect(30, 20, 10, 5.0);

    expect(rect.format('1'),
        "    <rect id=\"1\" width=\"30\" height=\"20\" rx=\"10\" ry=\"5.0\" />\n");
  });
}
