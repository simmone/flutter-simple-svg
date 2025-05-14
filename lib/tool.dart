import 'dart:math';

class Tool {
  static String roundTo(num arg, int precision) {
    num precisionPow = pow(10, precision);

    num roundedArg = (arg*precisionPow).round()/precisionPow;

    if (roundedArg == roundedArg.roundToDouble()) {
      return roundedArg.toInt().toString();
    } else {
      return '$roundedArg';
    }
  }
}
