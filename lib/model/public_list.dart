import 'package:wan_android_flutter/model/home.dart';
import 'package:json_annotation/json_annotation.dart';
part 'public_list.g.dart';

@JsonSerializable()
class PublicListData {
  int errorCode;
  String errorMsg;
  ArticleData data;

  PublicListData(this.errorCode, this.errorMsg, this.data);

  factory PublicListData.fromJson(Map<String, dynamic> json) =>
      _$PublicListDataFromJson(json);

  Map<String, dynamic> toJson() => _$PublicListDataToJson(this);
}
