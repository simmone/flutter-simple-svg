import 'package:simple_svg/tool.dart';

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

extension StrokeLineCapExtension on StrokeLineCap {
  String get name {
    switch (this) {
      case StrokeLineCap.butt:
        return 'butt';
      case StrokeLineCap.round:
        return 'round';
      case StrokeLineCap.square:
        return 'square';
      case StrokeLineCap.inherit:
        return 'inherit';
    }
  }
}

enum StrokeLineJoin {
  miter,
  round,
  bevel,
}

extension StrokeLineJoinExtension on StrokeLineJoin {
  String get name {
    switch (this) {
      case StrokeLineJoin.miter:
        return 'miter';
      case StrokeLineJoin.round:
        return 'round';
      case StrokeLineJoin.bevel:
        return 'bevel';
    }
  }
}

class Sstyle {
  String? fill;
  FillRule? fillRule;
  num? fillOpacity;
  String? stroke;
  num? strokeWidth;
  StrokeLineCap? strokeLineCap;
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
      outItems.add('fill-opacity="${Tool.round(fillOpacity!, super.precision!)}"');
    }

    if (strokeWidth != null) {
      outItems.add('stroke-width="${Tool.round(strokeWidth!, super.precision!)}"');
    }

    if (stroke != null) {
      outItems.add('stroke="$stroke"');
    }

    if (strokeLineJoin != null) {
      outItems.add('stroke-linejoin="${strokeLineJoin!.name}"');
    }

    if (strokeLineCap != null) {
      outItems.add('stroke-linecap="${strokeLineCap!.name}"');
    }

    if (strokeMiterLimit != null) {
      outItems.add('stroke-miterlimit="${Tool.round(strokeMiterLimit!, super.precision!)}"');
    }

    if (strokeDashArray != null) {
      outItems.add('stroke-dasharray="$strokeDashArray"');
    }

    if (strokeDashOffset != null) {
      outItems.add('stroke-dashoffset="${Tool.round(strokeDashOffset!, super.precision!)}"');
    }

    if ((translate != null) ||
        (rotate != null) ||
        (scaleAll != null) ||
        (scaleXy != null) ||
        (skewX != null) ||
        (skewY != null)) {
      var transforms = <String>[];

      if (translate != null) {
        transforms.add(
            'translate(${Tool.round(translate!.$1, super.precision!)} ${Tool.round(translate!.$2, super.precision!)})');
      }

      if (rotate != null) {
        transforms.add('rotate(${Tool.round(rotate!, super.precision!)})');
      }

      if ((scaleAll != null) || (scaleXy != null)) {
        if (scaleAll != null) {
          transforms.add('scale(${Tool.round(scaleAll!, super.precision!)})');
        } else {
          transforms.add(
              'scale(${Tool.round(scaleXy!.$1)} ${Tool.round(scaleXy!.$2)})');
        }
      }

      if (skewX != null) {
        transforms.add('skewX(${Tool.round(skewX!)})');
      }

      if (skewY != null) {
        transforms.add('skewY(${Tool.round(skewY!)})');
      }

      outItems.add('transform="${transforms.join(' ')}"');
    }

    return outItems.join(' ');
  }
}
