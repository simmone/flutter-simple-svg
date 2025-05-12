import 'dart:math' as math;

import 'package:simple_svg/define/shape.dart';

class Arrow implements Shape {
  num startX;
  num startY;
  num endX;
  num endY;
  num handleBase;
  num headBase;
  num headHeight;

  Arrow(this.startX, this.startY, this.endX, this.endY, this.handleBase, this.headBase, this.headHeight);
  
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

  @override
  String unique() {
    return 'Arrow/startX/$startX/startY/$startY/endX/$endX/endY/$endY/handleBase/$handleBase/headBase/$headBase/headHeight/$headHeight';
  }

  @override
  String format(String shapeId) {
    final totalBase = handleBase + headBase;

    final preEndX = endX;

    final preEndY = endY;

    final preTowardLeft = startX > preEndX ? true : false;

    final preTowardUpdown =  startX == preEndX ? true : false;

    final preTowardUp = (startX == preEndX) && (startY > preEndY) ? true : false;
      
    final preXOffset = preEndX - startX;
    
    final preYOffset = preEndY - startY;
    
    final preTheta = math.atan(preXOffset == 0.0 ? 0.0 : preYOffset / preXOffset);

    final preDeltaR = (
      headHeight * math.cos(preTheta),
      headHeight * math.sin(preTheta)
    );

    final preRSub1 = preTowardUpdown ? preDeltaR.$2 : preDeltaR.$1;

    final preRSub0 = preTowardUpdown ? preDeltaR.$1 : preDeltaR.$2;
      
    final preR = (
      preTowardLeft ? preEndX + preRSub1 : preEndX - preRSub1,
      preTowardUp || preTowardLeft ? preEndY + preRSub0 : preEndY - preRSub0
    );

    final newEndX = preR.$1;

    final newEndY = preR.$2;

    final towardLeft = startX > newEndX ? true : false;

    final towardUpdown = startX == newEndX ? true : false;
    
    final towardUp = (startX == newEndX) && (startY > newEndY) ? true : false;

    final xOffset = newEndX - startX;

    final yOffset = newEndY - startY;

    final theta = math.atan(xOffset == 0.0 ? 0.0 : yOffset / xOffset);

    final alpha = math.pi / 2.0 - theta;

    final deltaR = (
      headHeight * math.cos(theta),
      headHeight * math.sin(theta)
    );

    final rSub1 = towardUpdown ? deltaR.$2 : deltaR.$1;
    
    final rSub0 = towardUpdown ? deltaR.$1 : deltaR.$2;
    
    final r = (
      towardLeft ? newEndX - rSub1 : newEndX + rSub1,
      towardUp || towardLeft ? newEndY - rSub0 : newEndY + rSub0
    );
    
    final handleDeltaQ = (handleBase * math.cos(alpha), handleBase * math.sin(alpha));
    
    final handleDeltaQByTowardUpdown0 = towardUpdown? handleDeltaQ.$1 : handleDeltaQ.$2;
    
    final handleDeltaQByTowardUpdown1 = towardUpdown? handleDeltaQ.$2 : handleDeltaQ.$1;
    
    final handleBottomLeft = (
      towardLeft? startX + handleDeltaQByTowardUpdown1 : startX - handleDeltaQByTowardUpdown1,
      towardLeft? startY - handleDeltaQByTowardUpdown0 : startY + handleDeltaQByTowardUpdown0);

    final handleBottomRight = (
      towardLeft? newEndX + handleDeltaQByTowardUpdown1 : newEndX - handleDeltaQByTowardUpdown1,
      towardLeft? newEndY - handleDeltaQByTowardUpdown0 : newEndY + handleDeltaQByTowardUpdown0);

    final handleTopLeft = (
      towardLeft? startX - handleDeltaQByTowardUpdown1 : startX + handleDeltaQByTowardUpdown1,
      towardLeft? startY + handleDeltaQByTowardUpdown0 : startY - handleDeltaQByTowardUpdown0);

    final handleTopRight = (
      towardLeft? newEndX - handleDeltaQByTowardUpdown1 : newEndX + handleDeltaQByTowardUpdown1,
      towardLeft? newEndY + handleDeltaQByTowardUpdown0 : newEndY - handleDeltaQByTowardUpdown0);
    
    final headDeltaQ = (totalBase * math.cos(alpha), totalBase * math.sin(alpha));

    final headDeltaQByTowardUpdown0 = towardUpdown? headDeltaQ.$1 : headDeltaQ.$2;

    final headDeltaQByTowardUpdown1 = towardUpdown? headDeltaQ.$2 : headDeltaQ.$1;
    
    final q = (
      towardLeft? newEndX + headDeltaQByTowardUpdown1 : newEndX - headDeltaQByTowardUpdown1,
      towardLeft? newEndY - headDeltaQByTowardUpdown0 : newEndY + headDeltaQByTowardUpdown0);
    
    final s = (
      towardLeft? newEndX - headDeltaQByTowardUpdown1 : newEndX + headDeltaQByTowardUpdown1,
      towardLeft? newEndY + headDeltaQByTowardUpdown0 : newEndY - headDeltaQByTowardUpdown0);
    
    final buffer = StringBuffer();

    buffer.write('    <polygon id="$shapeId"\n');
    buffer.write('          points="\n');
    buffer.write('            ${roundTo(handleBottomLeft.$1, 4)},${roundTo(handleBottomLeft.$2, 4)}\n');
    buffer.write('            ${roundTo(handleBottomRight.$1, 4)},${roundTo(handleBottomRight.$2, 4)}\n');
    buffer.write('            ${roundTo(q.$1, 4)},${roundTo(q.$2, 4)}\n');
    buffer.write('            ${roundTo(r.$1, 4)},${roundTo(r.$2, 4)}\n');
    buffer.write('            ${roundTo(s.$1, 4)},${roundTo(s.$2, 4)}\n');
    buffer.write('            ${roundTo(handleTopRight.$1, 4)},${roundTo(handleTopRight.$2, 4)}\n');
    buffer.write('            ${roundTo(handleTopLeft.$1, 4)},${roundTo(handleTopLeft.$2, 4)}\n');
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
