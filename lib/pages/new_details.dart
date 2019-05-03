import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewDetailsPage extends StatelessWidget {
  final String title;
  final String link;

  NewDetailsPage({this.title, this.link});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: link,
        withZoom: true,
        withLocalStorage: true,
        appBar: AppBar(
          title: Text(title),
        ));
  }
}
