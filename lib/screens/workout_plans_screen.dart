import 'package:flutter/material.dart';

class WorkoutPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: const Color(0xff24324b),
        child: Text(
          'Tap here to create a new workout plan',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/create_workout');
        },
      ),
    );
  }
}
