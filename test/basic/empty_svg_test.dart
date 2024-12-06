import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic empty svg out', () {
    final simpleSvg = SimpleSvg(30, 20);
    
    await File('../../showcase/basic/empty.svg').readAsString().then((String contents) {
        expect(
          simpleSvg.out(),
          contents);
    });
  });
}
