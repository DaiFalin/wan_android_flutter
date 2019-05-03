// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerListData _$BannerListDataFromJson(Map<String, dynamic> json) {
  return BannerListData(
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
      data: (json['data'] as List)
          .map((e) => BannerData.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$BannerListDataToJson(BannerListData instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
      desc: json['desc'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
      isVisible: json['isVisible'] as int,
      order: json['order'] as int,
      title: json['title'] as String,
      type: json['type'] as int,
      url: json['url']);
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
