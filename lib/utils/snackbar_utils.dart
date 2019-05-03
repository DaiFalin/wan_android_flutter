import 'package:flutter/material.dart';

class SnackBarUtils {
  /// 显示SnackBar
  /// [context] 上线文对象
  /// [content] 内容
  static showSnackBar(BuildContext context, String content) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 1000),
      content: Text(content),
    ));
  }
}
