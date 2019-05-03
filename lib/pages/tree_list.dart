import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/home.dart';
import 'package:wan_android_flutter/model/tree.dart';
import 'package:wan_android_flutter/pages/home.dart';
import 'package:flukit/src/pull_refresh.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';

class TreeListPage extends StatefulWidget {
  final List<Children> data;
  final String title;

  TreeListPage(this.title, this.data);

  @override
  _TreeListPageState createState() => _TreeListPageState();
}

class _TreeListPageState extends State<TreeListPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: widget.data.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DefaultTabController(
        length: widget.data.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Colors.black,
              indicatorColor: Theme.of(context).accentColor,
              tabs: widget.data.map((children) {
                return Tab(
                  text: children.name,
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: widget.data.map((children) {
                    return TreeList(children.id);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeList extends StatefulWidget {
  final int id;

  TreeList(this.id);

  @override
  _TreeListState createState() => _TreeListState();
}

class _TreeListState extends State<TreeList> {
  int curPage = 0;
  List<ItemData> datas;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    datas = List<ItemData>();
    _getArticleData(curPage, widget.id);
    super.initState();
  }

  _TreeListState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && datas.length != 0) {
        curPage++;
        _getArticleData(curPage, widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return datas.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () async {
              curPage = 0;
              _getArticleData(curPage, widget.id);
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
          );
  }

  void _getArticleData(int curPage, int id) async {
    var response =
        await DioUtils().getDio().get('/article/list/$curPage/json?cid=$id');
    var newArticle = NewArticle.fromJson(response.data);
    setState(() {
      if (newArticle.errorCode == 0) {
        if (curPage == 0) {
          datas = newArticle.data.datas;
        } else {
          datas.addAll(newArticle.data.datas);
        }
      }
    });
  }
}
