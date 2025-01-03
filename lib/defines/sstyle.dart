enum FillRule {
  nonzero,
  evenodd,
  inerit,
}

extension FillRuleExtension on FillRule {
  String get name {
    switch (this) {
      case FillRule.nonzero:
        return 'nonzero';
      case FillRule.evenodd:
        return 'evenodd';
      case FillRule.inerit:
        return 'inerit';
    }
  }
}

enum StrokeLineCap {
  butt,
  round,
  square,
  inherit,
}

enum StrokeLineJoin {
  miter,
  round,
  bevel,
}

class Sstyle {
  String? fill;
  FillRule? fillRule;
  num? fillOpacity;
  String? stroke;
  num? strokeWidth;
  StrokeLineCap? strokeLinecap;
  StrokeLineJoin? strokeLineJoin;
  num? strokeMiterLimit;
  String? strokeDashArray;
  num? strokeDashOffset;
  (num, num)? translate;
  num? rotate;
  (num, num)? scaleXy;
  num? scaleAll;
  num? skewX;
  num? skewY;
  String? fillGradient;

  Sstyle();

  String format() {
    final outItems = <String>[];

    if (fillGradient != null) {
      outItems.add('fill="url(#$fillGradient)"');
    } else {
      if (fill != null) {
        outItems.add('fill="$fill"');
      } else {
        outItems.add('fill="none"');
      }
    }

    if (fillRule != null) {
      outItems.add('fill-rule="${fillRule!.name}"');
    }

    if (fillOpacity != null) {
      outItems.add('fill-opacity="$fillOpacity"');
    }

    return outItems.join(' ');
  }
}
