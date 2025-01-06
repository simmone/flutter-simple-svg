import 'shape.dart';
import 'group.dart';
import '../assets/constants.dart' as constants;

class Svg {
  final num width;
  final num height;
  int widgetIdCount = 0;
  Map<String, Shape> shapeDefineMap = {};
  Map<String, Group> groupDefineMap = {};
  List<Group> groupShowList = [];

  Svg(this.width, this.height);

  String defShape(Shape shape) {
    widgetIdCount += 1;
    String shapeId = 's$widgetIdCount';
    shapeDefineMap[shapeId] = shape;
    return shapeId;
  }

  String addNameGroup(String groupId, Group group) {
    groupDefineMap[groupId] = group;
    return groupId;
  }

  String addGroup(Group group) {
    widgetIdCount += 1;
    var groupId = 'g$widgetIdCount';
    addNameGroup(groupId, group);
    return groupId;
  }

  String addDefaultGroup(Group group) {
    var groupId = addNameGroup(constants.defaultGroupId, group);
    return groupId;
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

    return outBuffer.toString();
  }
}
