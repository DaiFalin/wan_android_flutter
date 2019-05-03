import 'package:flutter/material.dart';
import 'package:wan_android_flutter/model/collect.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/snackbar_utils.dart';

class CollectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收藏'),
      ),
      body: CollectPageState(),
    );
  }
}

class CollectPageState extends StatefulWidget {
  @override
  _CollectPageStateState createState() => _CollectPageStateState();
}

class _CollectPageStateState extends State<CollectPageState> {
  List<DatasListBean> datas;

  @override
  void initState() {
    datas = List<DatasListBean>();
    _getCollectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return datas.isNotEmpty
        ? Container(
            child: Center(
              child: Text(datas.length.toString()),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  /// 获取收藏的文章数据
  _getCollectData([int curPage = 0]) async {
    var response =
        await DioUtils.instance.getDio().get('/lg/collect/list/$curPage/json');
    var collect = Collect.fromJson(response.data);
    if (collect.errorCode == 0) {
      setState(() {
        datas = collect.data.datas;
      });
    }
  }
}
