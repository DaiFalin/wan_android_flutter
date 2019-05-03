class Collect {
  String errorMsg;
  int errorCode;
  DataBean data;

  Collect({this.errorMsg, this.errorCode, this.data});

  Collect.fromJson(Map<String, dynamic> json) {    
    this.errorMsg = json['errorMsg'];
    this.errorCode = json['errorCode'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMsg'] = this.errorMsg;
    data['errorCode'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

class DataBean {
  bool over;
  int curPage;
  int offset;
  int pageCount;
  int size;
  int total;
  List<DatasListBean> datas;

  DataBean({this.over, this.curPage, this.offset, this.pageCount, this.size, this.total, this.datas});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.over = json['over'];
    this.curPage = json['curPage'];
    this.offset = json['offset'];
    this.pageCount = json['pageCount'];
    this.size = json['size'];
    this.total = json['total'];
    this.datas = (json['datas'] as List)!=null?(json['datas'] as List).map((i) => DatasListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['over'] = this.over;
    data['curPage'] = this.curPage;
    data['offset'] = this.offset;
    data['pageCount'] = this.pageCount;
    data['size'] = this.size;
    data['total'] = this.total;
    data['datas'] = this.datas != null?this.datas.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class DatasListBean {
  String author;
  String chapterName;
  String desc;
  String envelopePic;
  String link;
  String niceDate;
  String origin;
  String title;
  int chapterId;
  int courseId;
  int id;
  int originId;
  int userId;
  int visible;
  int zan;
  num publishTime;

  DatasListBean({this.author, this.chapterName, this.desc, this.envelopePic, this.link, this.niceDate, this.origin, this.title, this.chapterId, this.courseId, this.id, this.originId, this.userId, this.visible, this.zan, this.publishTime});

  DatasListBean.fromJson(Map<String, dynamic> json) {    
    this.author = json['author'];
    this.chapterName = json['chapterName'];
    this.desc = json['desc'];
    this.envelopePic = json['envelopePic'];
    this.link = json['link'];
    this.niceDate = json['niceDate'];
    this.origin = json['origin'];
    this.title = json['title'];
    this.chapterId = json['chapterId'];
    this.courseId = json['courseId'];
    this.id = json['id'];
    this.originId = json['originId'];
    this.userId = json['userId'];
    this.visible = json['visible'];
    this.zan = json['zan'];
    this.publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['chapterName'] = this.chapterName;
    data['desc'] = this.desc;
    data['envelopePic'] = this.envelopePic;
    data['link'] = this.link;
    data['niceDate'] = this.niceDate;
    data['origin'] = this.origin;
    data['title'] = this.title;
    data['chapterId'] = this.chapterId;
    data['courseId'] = this.courseId;
    data['id'] = this.id;
    data['originId'] = this.originId;
    data['userId'] = this.userId;
    data['visible'] = this.visible;
    data['zan'] = this.zan;
    data['publishTime'] = this.publishTime;
    return data;
  }
}
