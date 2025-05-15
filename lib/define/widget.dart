import 'sstyle.dart';
import 'package:simple_svg/tool.dart';

class Widget {
  final String shapeId;
  (num, num)? at;
  Sstyle? sstyle;
  String? filterId;
  String? markerStartId;
  String? markerMidId;
  String? markerEndId;

  Widget(this.shapeId);

  String format() {
    final outItems = <String>[];

    outItems.add('<use xlink:href="#$shapeId"');

    if ((at != null) && (at != (0, 0))) {
      outItems.add('x="${Tool.round(at!.$1)}" y="${Tool.round(at!.$2)}"');
    }

    if (sstyle != null) {
      outItems.add(sstyle!.format());
    }

    if (filterId != null) {
      outItems.add('filter="url(#$filterId)"');
    }

    if (markerStartId != null) {
      outItems.add('marker-start="url(#$markerStartId)"');
    }

    if (markerMidId != null) {
      outItems.add('marker-mid="url(#$markerMidId)"');
    }

    if (markerEndId != null) {
      outItems.add('marker-end="url(#$markerEndId)"');
    }

    outItems.add('/>');

    return outItems.join(' ');
  }
}
