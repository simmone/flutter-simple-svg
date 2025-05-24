import 'dart:io';
import 'dart:math';
import 'package:complex/complex.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_svg/simple_svg.dart';

const canvasWidth = 600;
const canvasHeight = 600;
const startPoint = (300, 50);
const startLength = 120;
const startDeg = 100;
const startWidth = 3;
const stepWidth = 0.86;
const color = '#5a5';
const minLength = 0.5;
const centralReduction = 0.75;
const lateralReduction4 = 0.35;
const lateralDeg = 80;
const bend = 5;

(num, num) getEndPoint((num, num) startPoint, num length, num deg) {
  final end = Complex.polar(length, pi * 2 * deg / 360);

  return (startPorint.$1 + end.real, startPoing.$2 + end.imaginary);
}

void recursivePoints((num, num) loopStartPoint, num length, num deg, num width, List<(String, (num, num), (num, num))> lines) {
  if ((centralReduction * length) >= minLength) {
    final loopEndPoint = getEndPoint(loopStartPoint, length, deg);

    final trunctedWidth = '$width';

fn recursive_points(
    loop_start_point: (f64, f64),
    length: f64,
    deg: f64,
    width: f64,
    lines: &mut Vec<(String, (f64, f64), (f64, f64))>,
) {
    if (CENTRAL_REDUCTION * length) >= MIN_LENGTH {
        let loop_end_point = get_end_point(loop_start_point, length, deg, PRECISION);

        let truncted_width = format!("{:.2}", width);

        lines.push((
            truncted_width,
            (loop_start_point.0, CANVAS_HEIGHT - loop_start_point.1),
            (loop_end_point.0, CANVAS_HEIGHT - loop_end_point.1),
        ));

        // central branch
        recursive_points(
            loop_end_point,
            length * CENTRAL_REDUCTION,
            deg - BEND,
            width * STEP_WIDTH,
            lines,
        );

        // left branch
        recursive_points(
            loop_end_point,
            length * LATERAL_REDUCTION,
            deg + LATERAL_DEG - BEND,
            width * STEP_WIDTH,
            lines,
        );

        // right branch
        recursive_points(
            loop_end_point,
            length * LATERAL_REDUCTION,
            deg - LATERAL_DEG - BEND,
            width * STEP_WIDTH,
            lines,
        );
    }
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
  
  test('fern test', () async {

      final svg = Svg(canvasWidth, canvasHeight);

      var defaultGroup = Group();
  });
}
