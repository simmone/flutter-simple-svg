import 'sstyle.dart';

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

    if (sstyle != null) {
      outItems.add(sstyle!.format());
    }

    if ((at != null) && (at != (0, 0))) {
      outItems.add('x="${at!.$1}" y="${at!.$2}"');
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
