import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/banner.dart';
import 'package:flukit/src/swiper.dart';
import 'package:wan_android_flutter/model/home.dart';
import 'package:wan_android_flutter/pages/new_details.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/navigator_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWidget(),
    );
  }
}

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

/*
 * 轮播图
 */
class _BannerWidgetState extends State<BannerWidget> {
  List<Widget> images;
  SwiperController swiperController;

  @override
  void initState() {
    images = List<Widget>();
    swiperController = SwiperController();
    _getBannerData();
    super.initState();
  }

  @override
  void dispose() {
    if (swiperController != null) {
      swiperController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: images.isNotEmpty
          ? Swiper(
              controller: swiperController,
              autoStart: true,
              circular: true,
              indicator: RectangleSwiperIndicator(),
              children: images,
            )
          : new Center(
              // CircularProgressIndicator是一个圆形的Loading进度条
              child: new CircularProgressIndicator(),
            ),
    );
  }

  /*
   * 请求首页轮播图数据
   */
  _getBannerData() async {
    List<Widget> images = List<Widget>();
    Response response = await DioUtils().getDio().get(Api.BANNER_LIST);
    var bannerListData = BannerListData.fromJson(response.data);
    if (bannerListData.errorCode == 0) {
      for (var data in bannerListData.data) {
        images.add(_buildWidget(
            title: data.title, imagePath: data.imagePath, url: data.url));
      }
    }
    setState(() {
      this.images = images;
    });
  }

  /*
    构架banner布局
   */
  Widget _buildWidget({String title, String imagePath, String url}) {
    return GestureDetector(
      onTap: () {
        NavigatorUtils.push(
            context,
            NewDetailsPage(
              title: title,
              link: url,
            ));
      },
      child: Image.network(
        imagePath,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  int _curPage = 0;
  List<ItemData> datas;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    datas = List<ItemData>();
    _getHomeData(_curPage);
    super.initState();
  }

  _ListWidgetState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && datas.length != 0) {
        _curPage++;
        _getHomeData(_curPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _curPage = 0;
        _getHomeData(_curPage);
      },
      child: datas.isNotEmpty
          ? ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemBuilder: (context, index) => _buildItem(index),
              itemCount: datas.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  /*
   * 获取首页数据
   */
  _getHomeData(int curPage) async {
    var response = await DioUtils().getDio().get('/article/list/$curPage/json');
    var newArticle = NewArticle.fromJson(response.data);
    setState(() {
      if (newArticle.errorCode == 0) {
        if (curPage == 0) {
          datas = newArticle.data.datas;
        } else {
          if (newArticle.data.datas.length != 0) {
            datas.addAll(newArticle.data.datas);
          }
        }
      }
    });
  }

  /*
    构建item布局
   */
  Widget _buildItem(int index) {
    if (index == 0) {
      return BannerWidget();
    } else {
      return HomeItem(datas[index]);
    }
  }
}

class HomeItem extends StatelessWidget {
  final ItemData itemData;

  const HomeItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          NavigatorUtils.push(
              context,
              NewDetailsPage(
                title: itemData.title,
                link: itemData.link,
              ));
        },
        child: Card(
          margin: EdgeInsets.all(10.0),
          elevation: 2.0,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    itemData.title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Row(
                            children: <Widget>[
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: '作者：'),
                                  TextSpan(
                                    text: '${itemData.author}',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ]),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )),
                          Row(
                            children: <Widget>[
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: '发布时间：'),
                                  TextSpan(
                                    text: '${itemData.niceDate}',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ]),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              )),
        ));
  }
}
