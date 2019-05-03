import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/model/projects.dart';
import 'package:wan_android_flutter/pages/projects_list.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/navigator_utils.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  List<ProjectData> data;

  @override
  void initState() {
    data = List();
    _getProjectsData();
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
                  tabs: data.map((ProjectData projectData) {
                    return Tab(
                      text: projectData.name,
                    );
                  }).toList()),
              body: TabBarView(
                  children: data.map((ProjectData projectData) {
                    return ProjectsListPage(projectData.id);
                  }).toList()),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  void _getProjectsData() async {
    var response = await DioUtils().getDio().get(Api.PROJECT);
    var projects = Projects.fromJson(response.data);
    setState(() {
      if (projects.errorCode == 0) {
        data = projects.data;
      }
    });
  }
}
