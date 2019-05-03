import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: SearchPageState(),
    );
  }
}

class SearchPageState extends StatefulWidget {
  @override
  _SearchPageStateState createState() => _SearchPageStateState();
}

class _SearchPageStateState extends State<SearchPageState> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
