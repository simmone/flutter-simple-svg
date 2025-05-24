import 'dart:io';
import 'dart:math';
import 'package:complex/complex.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

(num, num) getEndPoint((num, num) startPoint, num length) {
  final end = Complex.polar(length, pi * 2 * deg / 360);

  return (
    (startPorint.$1 + end.imaginary) * (
  
    (
        ((start_point.0 + end.re) * (10.0f64.powf(precision))).round() / (10.0f64.powf(precision)),
        ((start_point.1 + end.im) * (10.0f64.powf(precision))).round() / (10.0f64.powf(precision)),
    )
}


void main() {
  test('make poloar test', () async {
      expect(
        Complex.polar(10, pi * 0.5),
        Complex(6.123233995736766e-16, 10.0)
      );

      expect(
        Complex.polar(10, pi * 0.25),
        Complex(7.0710678118654755, 7.071067811865475)
      );
  });
}
