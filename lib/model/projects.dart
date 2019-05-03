import 'package:json_annotation/json_annotation.dart';

part 'projects.g.dart';

@JsonSerializable()
class Projects {
  int errorCode;
  String errorMsg;
  List<ProjectData> data;

  Projects(this.errorCode, this.errorMsg, this.data);

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsToJson(this);
}

@JsonSerializable()
class ProjectData {
  List<String> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  ProjectData(this.children, this.courseId, this.id, this.name, this.order,
      this.parentChapterId, this.userControlSetTop, this.visible);

  factory ProjectData.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);
}
