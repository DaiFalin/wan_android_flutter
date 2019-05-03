import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/home.dart';
import 'package:wan_android_flutter/model/public_list.dart';
import 'package:wan_android_flutter/pages/home.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';

class PublicListPage extends StatefulWidget {
  final int id;

  PublicListPage(this.id);

  @override
  _PublicListPageState createState() => _PublicListPageState();
}

class _PublicListPageState extends State<PublicListPage> {
  int curPage = 0;
  List<ItemData> datas;
  ScrollController _controller = ScrollController();

  _PublicListPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && datas != null) {
        curPage++;
        _getPublicListData(curPage);
      }
    });
  }

  @override
  void initState() {
    datas = List();
    _getPublicListData(curPage);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: datas.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                itemBuilder: (context, index) => HomeItem(datas[index]),
                itemCount: datas.length,
              ),
              onRefresh: () async {
                curPage = 0;
                _getPublicListData(curPage);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _getPublicListData(int curPage) async {
    var response = await DioUtils()
        .getDio()
        .get('/wxarticle/list/${widget.id}/$curPage/json');
    var publicListData = PublicListData.fromJson(response.data);
    setState(() {
      if (publicListData.errorCode == 0) {
        if (curPage == 0) {
          datas = publicListData.data.datas;
        } else {
          datas.addAll(publicListData.data.datas);
        }
      }
    });
  }
}
