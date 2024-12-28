enum FillRule {
  nonzero,
  evenodd,
  inerit,
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
}
