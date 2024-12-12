import 'shape.dart';

class Svg {
  final num width;
  final num height;
  int widgetIdCount = 0;
  Map<String, Shape> shapeDefineMap = {};

  Svg(this.width, this.height);
  
  String defShape(shape: Shape) {
    widgetIdCount += 1;
    shapeDefineMap.
  }
}

  (let* ([new_widget_index (add1 (SVG-widget_id_count (*SVG*)))]
         [shape_id (format "s~a" new_widget_index)])

    (set-SVG-widget_id_count! (*SVG*) new_widget_index)

    (hash-set! (SVG-shape_define_map (*SVG*)) shape_id shape)

    shape_id))

