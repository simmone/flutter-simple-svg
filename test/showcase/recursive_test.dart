import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/define/shape/recursive.dart';

void main() {
  test('recursive', () {
    final recursive = Recursive(30.0, 20.0);
    expect(recursive.width, 30.0);
    expect(recursive.height, 20.0);
    expect(recursive.radiusX, null);
    expect(recursive.radiusY, null);
  });

  test('recursive_optional1', () {
    final recursive = Recursive(30.0, 20.0, 10.0);
    expect(recursive.width, 30.0);
    expect(recursive.height, 20.0);
    expect(recursive.radiusX, 10.0);
    expect(recursive.radiusY, null);
  });

  test('recursive_optional2', () {
    final recursive = Recursive(30.0, 20.0, 10.0, 5.0);
    expect(recursive.width, 30.0);
    expect(recursive.height, 20.0);
    expect(recursive.radiusX, 10.0);
    expect(recursive.radiusY, 5.0);
  });

  test('format1', () {
    final recursive = Recursive(30, 20);

    expect(
        recursive.format('1'), "    <recursive id=\"1\" width=\"30\" height=\"20\" />\n");
  });

  test('format2', () {
    final recursive = Recursive(30, 20, 10, 5.0);

    expect(recursive.format('1'),
        "    <recursive id=\"1\" width=\"30\" height=\"20\" rx=\"10\" ry=\"5.0\" />\n");
  });
}
