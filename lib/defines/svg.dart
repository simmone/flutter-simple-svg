import 'shape.dart';
import 'group.dart';
import '../assets/constants.dart' as Constants;

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
    var groupId = addNameGroup(Constants.defaultGroupId, group);
    return groupId;
  }
}
