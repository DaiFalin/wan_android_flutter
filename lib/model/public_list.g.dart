// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicListData _$PublicListDataFromJson(Map<String, dynamic> json) {
  return PublicListData(
      json['errorCode'] as int,
      json['errorMsg'] as String,
      json['data'] == null
          ? null
          : ArticleData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PublicListDataToJson(PublicListData instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };
