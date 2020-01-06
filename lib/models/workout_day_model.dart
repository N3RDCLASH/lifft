import 'package:flutter/material.dart';

class WorkoutDay extends StatelessWidget {
  final String name;
  final String day;

  WorkoutDay({
    Key key,
    this.name,
    this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name + " " + day);
  }
}
