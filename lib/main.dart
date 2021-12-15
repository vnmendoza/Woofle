import 'package:flutter/material.dart';
import 'package:woofle/Login/login_page.dart';
// this is a lambda expression to run application
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  bool darkMode = true;

  MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

// the program will load this first then run the login
//page after this

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Woofle',
      home: LoginScreen(),
      );
  }

}



