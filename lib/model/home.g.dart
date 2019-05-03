// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewArticle _$NewArticleFromJson(Map<String, dynamic> json) {
  return NewArticle(
      json['errorCode'] as int,
      json['errorMsg'] as String,
      json['data'] == null
          ? null
          : ArticleData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewArticleToJson(NewArticle instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return ArticleData(
      curPage: json['curPage'] as int,
      datas: (json['datas'] as List)
          ?.map((e) =>
              e == null ? null : ItemData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      offset: json['offset'] as int,
      over: json['over'] as bool,
      pageCount: json['pageCount'] as int,
      size: json['size'] as int,
      total: json['total'] as int);
}

Map<String, dynamic> _$ArticleDataToJson(ArticleData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return ItemData(
      apkLink: json['apkLink'] as String,
      author: json['author'] as String,
      chapterId: json['chapterId'] as int,
      chapterName: json['chapterName'] as String,
      collect: json['collect'] as bool,
      courseId: json['courseId'] as int,
      desc: json['desc'] as String,
      envelopePic: json['envelopePic'] as String,
      fresh: json['fresh'] as bool,
      id: json['id'] as int,
      link: json['link'] as String,
      niceDate: json['niceDate'] as String,
      origin: json['origin'] as String,
      projectLink: json['projectLink'] as String,
      publishTime: json['publishTime'] as int,
      superChapterId: json['superChapterId'] as int,
      superChapterName: json['superChapterName'] as String,
      tags: (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      title: json['title'] as String,
      type: json['type'] as int,
      userId: json['userId'] as int,
      visible: json['visible'] as int,
      zan: json['zan'] as int);
}

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'apkLink': instance.apkLink,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(json['name'] as String, json['url'] as String);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
