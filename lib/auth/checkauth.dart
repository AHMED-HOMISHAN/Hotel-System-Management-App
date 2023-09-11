// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:hotel/auth/auth.dart';
import 'package:hotel/auth/login.dart';
import 'package:hotel/screens/display/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class checkAuth extends StatefulWidget {
  const checkAuth({super.key});

  @override
  State<checkAuth> createState() => _checkAuthState();
}

var isStatus;

class _checkAuthState extends State<checkAuth> {
  bool isLogin = false;

  @override
  void initState() {
    Auth.chekStatus(context);
    setState(() {});
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    if (token == null) {
      setState(() {
        isLogin = false;
      });
    } else {
      print(token);
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      return const Home();
    } else {
      return const Login();
    }
  }
}
