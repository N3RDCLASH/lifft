import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/screens/wrapper.dart';
import 'package:LIFFT/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String _title = 'LIFFT';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
        title: MyApp._title,
        home: Wrapper(),
      ),
    );
  }
}
