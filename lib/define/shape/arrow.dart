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

  @override
  String format(String shapeId) {
    final totalBase = handleBase + headBase;

    final preEndX = endX;

    final preEndY = endY;

    final preTowardLeft = startX > preEndX ? true : false;
      
    final preTowardUpdown =  startX == preEndY ? true : false;
      
    final preTowardUp = (startX == preEndX) && (startY > preEndY) ? true : false;
      
    final preXOffset = preEndX - startX;
    
    final preYOffset = preEndY - startY;
    
    final preTheta = atan(preXOffset == 0.0 ? 0.0 : preYOffset / preXOffset);
        
    final preDeltaR = (
      headHeight * cos(preTheta),
      headHeight * sin(preTheta)
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

    final theta = atan(xOffset == 0.0 ? 0.0 : yOffset / xOffset);

    final alpha = math.pi / 2.0 - theta;

    final deltaR = (
      headHeight * cos(theta),
      headHeight * sin(theta)
    );

    final rSub1 = towardUpdown ? deltaR.$2 : deltaR.$1;
    
    final rSub0 = towardUpdown ? deltaR.$1 : deltaR.$2;
    
    final r = (
      towardLeft ? endX - rSub1 : endX + rSub1,
      towardUp || towardLeft ? endY - rSub0 : dndY + rSub0
    );
    
    final handleDeltaQ = (handleBase * cos(alpha), handleBase * sin(alpha));

    final handleDeltaQByTowardUpdown0 = towardUpdown? handleDeltaQ.$1 : handleDeltaQ.$2;
    
    final handleDeltaQByTowardUpdown1 = towardUpdown? handleDeltaQ.$2 : handleDeltaQ.$1;
    
    final handleBottomLeft = (
      towardLeft? startX + handleDeltaQByTowardUpdown1 : startX - handleDeltaQByTowardUpdown1,
      towardLeft? startY - handleDeltaQByTowardUpdown0 : startY + handleDeltaQByTowardUpdown0);

    final handleBottomRight = (
      towardLeft? endX + handleDeltaQByTowardUpdown1 : endX - handleDeltaQByTowardUpdown1,
      towardLeft? endY - handleDeltaQByTowardUpdown0 : endY + handleDeltaQByTowardUpdown0);

    final handleTopLeft = (
      towardLeft? startX - handleDeltaQByTowardUpdown1 : startX + handleDeltaQByTowardUpdown1,
      towardLeft? startY + handleDeltaQByTowardUpdown0 : startY - handleDeltaQByTowardUpdown0);

    final handleTopRight = (
      towardLeft? endX - handleDeltaQByTowardUpdown1 : endX + handleDeltaQByTowardUpdown1,
      towardLeft? endY + handleDeltaQByTowardUpdown0 : endY - handleDeltaQByTowardUpdown0);
    
    final headDeltaQ = (totalBase * cos(alpha), totalBase * sin(alpha));
    
    final headDeltaQByTowardUpdown0 = towardUpdown? headDeltaQ.$1 : headDeltaQ.$2;

    final headDeltaQByTowardUpdown1 = towardUpdown? headDeltaQ.$2 : headDeltaQ.$1;
    
    final q = (
      towardLeft? endX + headDeltaQByTowardUpdown1 : endX - headDeltaQByTowardUpdown0,
      towardLeft? endY - headDeltaQByTowardUpdown0 : endY + headDeltaQByTowardUpdown0);

    final s = (
      towardLeft? endX - headDeltaQByTowardUpdown1 : endX + headDeltaQByTowardUpdown0,
      towardLeft? endY + headDeltaQByTowardUpdown0 : endY - headDeltaQByTowardUpdown0);
    
    final buffer = StringBuffer();

    buffer.write('    <polygon id=%shapeId\n');
    buffer.write('          points="\n');
    buffer.write('            ${handleBottomLeft.$1.toStringAsFixed(4)},${handleBottomLeft.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${handleBottomRight.$1.toStringAsFixed(4)},${handleBottomRight.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${q.$1.toStringAsFixed(4)},${q.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${r.$1.toStringAsFixed(4)},${r.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${s.$1.toStringAsFixed(4)},${s.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${handleTopRight.$1.toStringAsFixed(4)},${handleTopRight.$2.toStringAsFixed(4)}\n');
    buffer.write('            ${handleTopLeft.$1.toStringAsFixed(4)},${handleTopLeft.$2.toStringAsFixed(4)}\n');
    buffer.write('            "/>\n');

    return buffer.toString();
  }
}
