import 'package:flutter/material.dart';

class WorkoutDay extends StatefulWidget {
  final String name;
  final String day;

  WorkoutDay({
    Key key,
    this.name,
    this.day,
  }) : super(key: key);

  @override
  _WorkoutDayState createState() => _WorkoutDayState();
}

class _WorkoutDayState extends State<WorkoutDay> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.name + " " + widget.day);
  }
}
