import 'package:json_annotation/json_annotation.dart';

part 'public_num.g.dart';
@JsonSerializable()
class PublicData{
  int errorCode;
  String errorMsg;
  List<Data> data;

  PublicData(this.errorCode, this.errorMsg, this.data);

  factory PublicData.fromJson(Map<String, dynamic> json) =>
      _$PublicDataFromJson(json);

  Map<String, dynamic> toJson() => _$PublicDataToJson(this);
}
@JsonSerializable()
class Data {
   List<String> children;
   int courseId;
   int id;
   String name;
   int order;
   int parentChapterId;
   bool userControlSetTop;
   int visible;

   Data(this.children, this.courseId, this.id, this.name, this.order,
       this.parentChapterId, this.userControlSetTop, this.visible);

   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

   Map<String, dynamic> toJson() => _$DataToJson(this);
}