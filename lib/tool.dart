class Tool {
  static String roundTo(num arg, int precision) {
    if (arg is int || arg == arg.roundToDouble()) {
      return arg.toInt().toString();
    } else {
      final roundArg = num.parse(arg.toStringAsFixed(precision));

      if (roundArg == roundArg.roundToDouble()) {
        return roundArg.toInt().toString();
      } else {
        return roundArg.toString();
      }
    }
  }
}
