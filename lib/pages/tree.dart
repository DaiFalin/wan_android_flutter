import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/tree.dart';
import 'package:wan_android_flutter/pages/tree_list.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/navigator_utils.dart';

class TreePage extends StatefulWidget {
  @override
  _TreePage createState() => _TreePage();
}

class _TreePage extends State<TreePage> {
  List<Children> data;

  @override
  void initState() {
    data = List<Children>();
    _getTreeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? ListView.builder(
            itemBuilder: (BuildContext context, index) => _buildItem(index),
            itemCount: data.length,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  /*
   * 构建item布局
   */
  Widget _buildItem(int index) {
    String content = '';
    for (var value in data[index].children) {
      content += '${value.name}   ';
    }
    return Card(
      elevation: 2.0,
      child: ListTile(
        onTap: () {
          NavigatorUtils.push(
              context, TreeListPage(data[index].name, data[index].children));
        },
        title: Text(data[index].name),
        subtitle: Text(
          content,
          softWrap: true,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  _getTreeData() async {
    var response = await DioUtils().getDio().get(Api.TREE);
    var tree = Tree.fromJson(response.data);
    setState(() {
      if (tree.errorCode == 0) {
        this.data = tree.data;
      }
    });
  }
}
