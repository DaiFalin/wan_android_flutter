// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projects _$ProjectsFromJson(Map<String, dynamic> json) {
  return Projects(
      json['errorCode'] as int,
      json['errorMsg'] as String,
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ProjectData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ProjectsToJson(Projects instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) {
  return ProjectData(
      (json['children'] as List)?.map((e) => e as String)?.toList(),
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
