import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/public_num.dart';
import 'package:wan_android_flutter/pages/public_list.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/navigator_utils.dart';

class PublicPage extends StatefulWidget {
  @override
  _PublicPageState createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage>
    with SingleTickerProviderStateMixin {
  List<Data> data;

  @override
  void initState() {
    data = List();
    _getPublicData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? DefaultTabController(
            length: data.length,
            child: Scaffold(
              appBar: TabBar(
                  isScrollable: true,
                  labelColor: Theme.of(context).accentColor,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Theme.of(context).accentColor,
                  tabs: data.map((Data data) {
                    return Tab(
                      text: data.name,
                    );
                  }).toList()),
              body: TabBarView(
                  children: data.map((Data data) {
                    return PublicListPage(data.id);
                  }).toList()),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  _getPublicData() async {
    var response = await DioUtils().getDio().get(Api.PUBLIC);
    var publicData = PublicData.fromJson(response.data);
    setState(() {
      if (publicData.errorCode == 0) {
        data = publicData.data;
      }
    });
  }
}
