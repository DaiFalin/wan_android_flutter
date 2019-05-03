import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/api.dart';
import 'package:wan_android_flutter/utils/dio_utils.dart';
import 'package:wan_android_flutter/utils/snackbar_utils.dart';
import 'package:path_provider/path_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  _LoginPageState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(32.0),
            child: ListView(
              children: <Widget>[
                TextField(
                  maxLength: 20,
                  onChanged: (v) {
                    username = v;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: '用户名',
                    hintText: '请输入用户名',
                  ),
                ),
                TextField(
                  maxLength: 20,
                  onChanged: (v) {
                    password = v;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: '密码',
                    hintText: '请输入密码',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (username.isNotEmpty && password.isNotEmpty) {
                        _login(context);
                      } else {
                        SnackBarUtils.showSnackBar(context, '请输入账号或者密码');
                      }
                    },
                    child: Text('登录'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (username.isNotEmpty && password.isNotEmpty) {
                        _register(context);
                      } else {
                        SnackBarUtils.showSnackBar(context, '请输入账号或者密码');
                      }
                    },
                    child: Text('注册'),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  _login(BuildContext context) async {
    var formData = FormData.from({
      'username': username,
      'password': password,
    });
    var response =
        await DioUtils.instance.getDio().post(Api.LOGIN, data: formData);
    var errorCode = response.data['errorCode'];
    if (errorCode == 0) {
      SnackBarUtils.showSnackBar(context, '登录成功');
      Navigator.pop(context);
    } else {
      SnackBarUtils.showSnackBar(context, '登录失败，请检查账号或者密码');
    }
  }

  void _register(BuildContext context) async {
    var formData = FormData.from({
      'username': username,
      'password': password,
      'repassword': password,
    });
    var response =
        await DioUtils.instance.getDio().post(Api.REGISTER, data: formData);
    var errorCode = response.data['errorCode'];
    if (errorCode == 0) {
      SnackBarUtils.showSnackBar(context, '注册成功');
      Navigator.pop(context);
    } else {
      SnackBarUtils.showSnackBar(context, '注册失败');
    }
  }
}
