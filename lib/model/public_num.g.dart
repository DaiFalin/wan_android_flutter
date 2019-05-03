// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_num.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicData _$PublicDataFromJson(Map<String, dynamic> json) {
  return PublicData(
      json['errorCode'] as int,
      json['errorMsg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PublicDataToJson(PublicData instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['children'] as List)?.map((e) => e as String)?.toList(),
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
