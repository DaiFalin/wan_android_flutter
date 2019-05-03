import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class NewArticle {
  int errorCode;
  String errorMsg;
  ArticleData data;

  NewArticle(this.errorCode, this.errorMsg, this.data);

  factory NewArticle.fromJson(Map<String, dynamic> json) =>
      _$NewArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NewArticleToJson(this);
}

@JsonSerializable()
class ArticleData {
  int curPage;
  List<ItemData> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  ArticleData({this.curPage, this.datas, this.offset, this.over, this.pageCount,
    this.size, this.total});

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataToJson(this);
}

@JsonSerializable()
class ItemData {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<Tags> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  ItemData({this.apkLink,
    this.author,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.envelopePic,
    this.fresh,
    this.id,
    this.link,
    this.niceDate,
    this.origin,
    this.projectLink,
    this.publishTime,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan});

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}

@JsonSerializable()
class Tags {
  String name;
  String url;

  Tags(this.name, this.url);

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
