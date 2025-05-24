import 'dart:io';
import 'dart:math';
import 'package:complex/complex.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

Complex makePolar(num magnitude, num angle) {
  final complexNumber = Complex(0, 1);

  return Complex(cos(angle) * magnitude) + (Complex(sin(angle) * magnitude) * complexNumber);
}

void main() {
  test('make poloar test', () async {
      expect(
        makePolar(10, pi * 0.5),
        Complex(6.123233995736766e-16, 10.0)
      );

      expect(
        makePolar(10, pi * 0.25),
        Complex(7.0710678118654755, 7.071067811865475)
      );
  });
}
