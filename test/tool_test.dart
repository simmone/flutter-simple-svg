import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/tool.dart';

void main() {
  test('round', () {
      expect(Tool.round(30.0), '30');
      expect(Tool.round(30), '30');
      expect(Tool.round(30.0000), '30');
      expect(Tool.round(30.0001), '30.0001');
      expect(Tool.round(30.00001), '30');
      expect(Tool.round(30), '30');
      expect(Tool.round(30.123), '30.123');
      expect(Tool.round(30.1234), '30.1234');
      expect(Tool.round(30.12344), '30.1234');
      expect(Tool.round(30.12345), '30.1235');
  });
}
