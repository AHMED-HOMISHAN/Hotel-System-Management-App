// ignore_for_file: library_prefixes, use_build_context_synchronously

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:hotel/api/dio.dart';
import 'package:hotel/auth/checkauth.dart';
import 'package:hotel/auth/login.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/screens/display/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool isloggin = false;
  List<String> info = [];

  bool get authenticated => isloggin;

  static Future<void> chekStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get('/user',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }));
    isStatus = response.data['status'];
    if (isStatus == '0') {
      print(isStatus);
      Auth().logout(context);
    }
  }

  Future<void> login(Map creds, BuildContext context) async {
    try {
      Dio.Response response = await dio().post('/userLogin', data: creds);
      String token = response.data.toString();

      tryToken(token, context);
    } catch (e) {
      print('login error is ${e}');
    }
  }

  Future<void> tryToken(String token, BuildContext context) async {
    if (token.isEmpty) {
      return;
    } else {
      final prefs = await SharedPreferences.getInstance();

      Dio.Response response = await dio().get('/user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));

      isloggin = true;
      info = [
        response.data['name'],
        response.data['email'],
        response.data['type']
      ];

      await prefs.setStringList('info', info);
      storeToken(token, context);

      notifyListeners();
    }
  }

  Future<void> storeToken(String token, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ));
  }

  Future<void> logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await dio().get('/userLogout',
          options: Dio.Options(headers: {
            'Authorization': 'Bearer ${prefs.getString('token')}'
          }));
      clearAll();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ));
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();

    isloggin = false;
    await prefs.remove('token');
    await prefs.remove('info');
    notifyListeners();
  }
}
