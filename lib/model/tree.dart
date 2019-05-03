import 'package:json_annotation/json_annotation.dart';

part 'tree.g.dart';

@JsonSerializable()
class Tree {
  List<Children> data;
  int errorCode;
  String errorMsg;


  Tree({this.data, this.errorCode, this.errorMsg});

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);

  Map<String, dynamic> toJson() => _$TreeToJson(this);
}

@JsonSerializable()
class Children {
  List<Children> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;


  Children({this.children, this.courseId, this.id, this.name, this.order,
    this.parentChapterId, this.userControlSetTop, this.visible});

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}
