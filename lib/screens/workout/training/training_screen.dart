import 'package:flutter/material.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "meow",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
