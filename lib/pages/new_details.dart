import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewDetailsPage extends StatelessWidget {
  final String title;
  final String link;

  NewDetailsPage({this.title, this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
