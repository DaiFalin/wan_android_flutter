// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tree _$TreeFromJson(Map<String, dynamic> json) {
  return Tree(
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Children.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String);
}

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) {
  return Children(
      children: (json['children'] as List)
          ?.map((e) =>
              e == null ? null : Children.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      courseId: json['courseId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      order: json['order'] as int,
      parentChapterId: json['parentChapterId'] as int,
      userControlSetTop: json['userControlSetTop'] as bool,
      visible: json['visible'] as int);
}

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
