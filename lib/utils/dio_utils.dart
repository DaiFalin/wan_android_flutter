import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DioUtils {
  factory DioUtils() => _getInstance();

  static DioUtils get instance => _getInstance();
  static DioUtils _instance;
  Dio _dio;

  DioUtils._internal() {
    // 初始化
    BaseOptions options = BaseOptions(
      baseUrl: Api.BASE_URL,
    );
    _dio = Dio(options);
  }

  static DioUtils _getInstance() {
    if (_instance == null) {
      _instance = DioUtils._internal();
      _setCookie();
    }
    return _instance;
  }

  /// 获取Dio实例
  Dio getDio() {
    return _dio;
  }

  static _setCookie() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var cj = PersistCookieJar(dir: "${directory.path}/cookie");
    instance.getDio().interceptors.add(CookieManager(cj));
  }
}
