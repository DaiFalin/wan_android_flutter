import 'package:flutter/material.dart';

class NavigatorUtils {
  /// 跳转Widget
  /// [context] 上下文对象
  /// [widget] 目标Widget
  static void push(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return widget;
      }),
    );
  }
}