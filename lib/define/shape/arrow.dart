import 'dart:math';

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
      preTowardLeft ? preEndX + preRSub1,
      preTowardUp || preTowardLeft ? preEndY + preRSub0 : preEndY - preRSub0
    );
    
    final newEndX = preR.$1;
    
    final newEndY = preR.$2;
    
    final towardLeft = startX > newEndX ? true : false;

    final towardUpdown = startX == newEndX ? true : false;

    final towardUp = (startX == newEndX) && (startY > newEndY) ? true : false;
      
    final buffer = StringBuffer();

    return buffer.toString();
  }
}
