import 'dart:math';

import 'shape.dart';

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

    final preTowardLef =
      if (startX > preEndX) {
        return true;
      } else {
        return false;
      };
      
    final preTowardUpdown =
      if (startX == preEndY) {
        return true;
      } else {
        return false;
      };
      
    final preTowardUp = 
      if ((startX == preEndX) && (startY > preEndY)) {
        return true;
      } else {
        return false;
      };
      
    final preXOffset = preEndX - startX;
    
    final preYOffset = preEndY - startY;
    
    final preTheta =
      atan(
        if (preXOffset == 0.0) {
          return 0.0;
        } else {
          return preYOffset / preXOffset;
        });
        
    final preDeltaR = (
      headHeight * cos(preTheta),
      headHeight * sin(preTheta)
    );
    
    final preRSub1 =
      if (preTowardUpdown) {
        return preDeltaR.$2;
      } else {
        return preDeltaR.$1;
      };

    final preRSub0 = 
      if (preTowardUpdown) {
        return preDeltaR.$1;
      } else {
        return preDeltaR.$2;
      };

    final buffer = StringBuffer();

    return buffer.toString();
  }
}
