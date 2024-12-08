import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

void main() {
  test('basic empty svg out', () async {
    final simpleSvg = SimpleSvg(30, 20);
    final file = new File('showcase/basic/empty.svg');
    final emptySvgFile = await file.readAsString();
    
    expect(simpleSvg.out(), emptySvgFile);
  });
}
