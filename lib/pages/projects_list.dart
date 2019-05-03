import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/home.dart';
import 'package:wan_android_flutter/pages/home.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';

class ProjectsListPage extends StatefulWidget {
  final int id;

  ProjectsListPage( this.id);

  @override
  _ProjectsListPageState createState() => _ProjectsListPageState();
}

class _ProjectsListPageState extends State<ProjectsListPage> {
  int _curPage = 0;
  List<ItemData> datas;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    datas = List<ItemData>();
    _getProjectsListData(_curPage);
    super.initState();
  }

  _ProjectsListPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && datas.length != 0) {
        _curPage++;
        _getProjectsListData(_curPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: datas.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                _curPage = 0;
                _getProjectsListData(_curPage);
              },
              child: ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                itemBuilder: (context, index) => HomeItem(datas[index]),
                itemCount: datas.length,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void _getProjectsListData(int curPage) async {
    var response = await DioUtils().getDio()
        .get('/project/list/$curPage/json?cid=${widget.id}');
    var newArticle = NewArticle.fromJson(response.data);
    setState(() {
      if (curPage == 0) {
        datas = newArticle.data.datas;
      } else {
        if (newArticle.data.datas.length != 0) {
          datas.addAll(newArticle.data.datas);
        }
      }
    });
  }
}
