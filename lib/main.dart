import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/about.dart';
import 'package:wan_android_flutter/pages/collect.dart';
import 'package:wan_android_flutter/pages/home.dart';
import 'package:wan_android_flutter/pages/login.dart';
import 'package:wan_android_flutter/pages/public.dart';
import 'package:wan_android_flutter/pages/projects.dart';
import 'package:wan_android_flutter/pages/search.dart';
import 'package:wan_android_flutter/pages/tree.dart';
import 'package:wan_android_flutter/pages/new_details.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/navigator_utils.dart';

void main() {
  init();
  runApp(MyApp());
}

init(){
  DioUtils.instance;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '玩android',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with 'flutter run'. You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // 'hot reload' (press 'r' in the console where you ran 'flutter run',
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: MyMainPage(),
      routes: <String, WidgetBuilder>{
        '/new_details': (context) => NewDetailsPage(),
      },
    );
  }
}

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() {
    return _MainDrawerState();
  }
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: GestureDetector(
            onTap: () {
              NavigatorUtils.push(context, LoginPage());
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.people),
                  Text('未登录'),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('收藏'),
          onTap: () {
            NavigatorUtils.push(context, CollectPage());
          },
        ),
        Divider(),
        ListTile(
          title: Text('关于'),
          onTap: () {
            NavigatorUtils.push(context, AboutPage());
          },
        )
      ],
    );
  }
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  DateTime _lastPressedAt; //上次点击时间
  String _appBarTitle;
  int _currentIndex = 0;
  final List<String> _tabPagesString = ['首页', '体系', '项目', '公众号'];
  final List<Widget> _tabPages = [
    HomePage(),
    TreePage(),
    ProjectsPage(),
    PublicPage(),
  ];

  @override
  void initState() {
    super.initState();
    _appBarTitle = _tabPagesString[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(_appBarTitle),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    NavigatorUtils.push(context, SearchPage());
                  })
            ],
          ),
          body: IndexedStack(
            children: _tabPages,
            index: _currentIndex,
          ),
          drawer: Drawer(
            child: MainDrawer(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), title: Text('体系')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pages), title: Text('项目')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.public), title: Text('公众号')),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _appBarTitle = _tabPagesString[index];
              });
            },
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
