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

    outItems.add('/>');

    return outItems.join(' ');
  }
}
