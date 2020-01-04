import 'package:flutter/material.dart';
import './screens/create_workout_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LIFFT",
      home: Home(),
      routes: {
        '/create_workout': (context) => CreateWorkout(),
      },
    );
  }
}
