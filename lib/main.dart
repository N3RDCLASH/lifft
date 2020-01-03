import 'package:flutter/material.dart';
// impo
import 'package:lifft/screens/home_screen.dart';
import 'package:lifft/screens/login_screen.dart';
import 'package:lifft/style/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String _title = 'LIFFT';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: Login(),
    );
  }
}
