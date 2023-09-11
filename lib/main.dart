import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel/api/const.dart';
import 'package:hotel/auth/auth.dart';
import 'package:hotel/auth/checkauth.dart';
import 'package:hotel/services/data.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Auth()),
      ChangeNotifierProvider(create: (context) => Data()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Managmenet',
      theme: ThemeData
      (
        primarySwatch: Colors.teal,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color.fromARGB(185, 2, 94, 84)),
          titleTextStyle: TextStyle(
              color: Color.fromARGB(185, 2, 94, 84),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
      ),
      
      home: const checkAuth(),
    );
  }
}
