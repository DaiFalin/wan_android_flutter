import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(nullable: false)
class BannerListData {
  int errorCode;
  String errorMsg;
  List<BannerData> data;

  BannerListData({this.errorCode, this.errorMsg, this.data});

  factory BannerListData.fromJson(Map<String, dynamic> json) =>
      _$BannerListDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListDataToJson(this);
}

@JsonSerializable()
class BannerData {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  var url;

  BannerData({this.desc, this.id, this.imagePath, this.isVisible, this.order,
    this.title, this.type, this.url});

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}
