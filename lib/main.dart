import 'package:flutter/material.dart';
import 'package:woofle/Login/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  bool darkMode = true;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title: 'Woofle',
      home: LoginScreen(),
      );
  }

}



