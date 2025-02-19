export 'package:simple_svg/defines/rect.dart' show Rect;
export 'package:simple_svg/defines/circle.dart' show Circle;
export 'package:simple_svg/defines/ellipse.dart' show Ellipse;
export 'package:simple_svg/defines/line.dart' show Line;
export 'package:simple_svg/defines/polygon.dart' show Polygon;
export 'package:simple_svg/defines/polyline.dart' show Polyline;
export 'package:simple_svg/defines/filter.dart' show Filter;
export 'package:simple_svg/defines/path.dart' show Path, ArcDirection;
export 'package:simple_svg/defines/gradient.dart' show LinearGradient, RadialGradient;
export 'package:simple_svg/defines/widget.dart' show Widget;
export 'package:simple_svg/defines/group.dart' show Group;
export 'package:simple_svg/defines/sstyle.dart' show Sstyle, StrokeLineJoin, FillRule, StrokeLineCap;

import 'package:simple_svg/defines/shape.dart';
import 'package:simple_svg/defines/rect.dart';
import 'package:simple_svg/defines/widget.dart';
import 'package:simple_svg/defines/sstyle.dart';
import 'package:simple_svg/defines/group.dart';

import '../assets/constants.dart' as constants;

/// Svg a library to generate svg file easily.
class Svg {
  final num width;
  final num height;
  String? background;
  (num, num, num, num)? viewBox;
  int shapeIdCount = 0;
  int groupIdCount = 0;
  Map<String, Shape> shapeDefineMap = {};
  Map<String, Group> groupDefineMap = {};
  List<(String, (num, num))> groupShowList = [];

  Svg(this.width, this.height);

  String defShape(Shape shape) {
    shapeIdCount += 1;
    String shapeId = 's$shapeIdCount';
    shapeDefineMap[shapeId] = shape;
    return shapeId;
  }

  String addNameGroup(String groupId, Group group) {
    groupDefineMap[groupId] = group;
    return groupId;
  }

  String addGroup(Group group) {
    groupIdCount += 1;
    var groupId = 'g$groupIdCount';
    addNameGroup(groupId, group);
    return groupId;
  }

  String addDefaultGroup(Group group) {
    var groupId = addNameGroup(constants.defaultGroupId, group);
    return groupId;
  }

  void setBackground(String backgroundColor) {
    background = backgroundColor;

    final rectId = defShape(Rect(width, height));

    var sstyle = Sstyle();
    sstyle.fill = background;
    var widget = Widget(rectId);
    widget.sstyle = sstyle;

    var backgroundGroup = Group();
    backgroundGroup.placeWidget(widget);

    addNameGroup(constants.backgroundGroupId, backgroundGroup);
  }

  void setViewBox(num minX, num minY, num width, num height) {
    viewBox = (minX, minY, width, height);
  }

  String flushData() {
    final outBuffer = StringBuffer();

    if (shapeDefineMap.isNotEmpty) {
      outBuffer.write("  <defs>\n");
      var sortedKeys = List.from(shapeDefineMap.keys);
      sortedKeys.sort();
      for (final shapeId in sortedKeys) {
        var shape = shapeDefineMap[shapeId];

        outBuffer.write(shape!.format(shapeId));
      }
      outBuffer.write("  </defs>\n");
    }

    final noDefaultGroupIds = groupDefineMap.keys
        .where((groupId) => groupId != constants.defaultGroupId);

    for (final groupId in noDefaultGroupIds) {
      outBuffer.write('\n');
      outBuffer.write('  <symbol id="$groupId">\n');
      outBuffer.write(showGroupWidgets(groupId, "    "));
      outBuffer.write('  </symbol>\n');
    }

    final groupShows =
        groupShowList.where((rec) => rec.$1 != constants.defaultGroupId);

    if (groupShows.isNotEmpty) {
      outBuffer.write('\n');
    }

    for (final groupShow in groupShows) {
      final groupId = groupShow.$1;
      final groupPos = groupShow.$2;

      outBuffer.write('  <use xlink:href="#$groupId" ');
      if (groupPos != (0, 0)) {
        outBuffer.write('x="${groupPos.$1}" y="${groupPos.$2}" ');
      }
      outBuffer.write('/>\n');
    }

    var defaultGroup = groupDefineMap[constants.defaultGroupId];

    if (defaultGroup != null) {
      if (defaultGroup.widgetList.isNotEmpty) {
        outBuffer.write('\n');
        outBuffer.write(showGroupWidgets(constants.defaultGroupId, '  '));
      }
    }

    return outBuffer.toString();
  }

  String showGroupWidgets(String groupId, String prefix) {
    var group = groupDefineMap[groupId];

    var groupBuffer = StringBuffer();

    if (group != null) {
      for (final widget in group.widgetList) {
        groupBuffer.write(prefix);
        groupBuffer.write(widget.format());
        groupBuffer.write('\n');
      }
    }

    return groupBuffer.toString();
  }

  String out() {
    final outBuffer = StringBuffer();

    outBuffer.write('<svg\n');
    outBuffer.write('    version="1.1"\n');
    outBuffer.write('    xmlns="http://www.w3.org/2000/svg"\n');
    outBuffer.write('    xmlns:xlink="http://www.w3.org/1999/xlink"\n');
    outBuffer.write('    width="$width" height="$height"\n');

    if (viewBox != null) {
      outBuffer.write(
          '    viewBox="${viewBox!.$1} ${viewBox!.$2} ${viewBox!.$3} ${viewBox!.$4}"\n');
    }

    outBuffer.write('    >\n');

    if (background != null) {
      groupShowList.add((constants.backgroundGroupId, (0, 0)));
    }

    var defaultGroup = groupDefineMap[constants.defaultGroupId];

    if (defaultGroup != null) {
      if (defaultGroup.widgetList.isNotEmpty) {
        groupShowList.add((constants.defaultGroupId, (0, 0)));
      }
    }

    outBuffer.write(flushData());

    outBuffer.write('</svg>\n');

    return outBuffer.toString();
  }
}
