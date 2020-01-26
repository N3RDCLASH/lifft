import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogExercise extends StatefulWidget {
  final DocumentSnapshot ds;

  LogExercise(this.ds);

  @override
  _LogExerciseState createState() => _LogExerciseState();
}

class _LogExerciseState extends State<LogExercise> {
  _getMuscleIcon(String muscleGroup) {
    switch (muscleGroup) {
      case "Abs":
        {
          return Image.asset('assets/muscle_icons/abs.png');
        }
        break;
      case "Back":
        {
          return Image.asset('assets/muscle_icons/back.png');
        }
        break;
      case "Biceps":
        {
          return Image.asset('assets/muscle_icons/biceps.png');
        }
        break;
      case "Chest":
        {
          return Image.asset('assets/muscle_icons/chest.png');
        }
        break;
      case "Forearms":
        {
          return Image.asset('assets/muscle_icons/biceps.png');
        }
        break;
      case "Glutes":
        {
          return Image.asset('assets/muscle_icons/glutes.png');
        }
        break;
      case "Shoulders":
        {
          return Image.asset('assets/muscle_icons/shoulders.png');
        }
        break;
      case "Triceps":
        {
          return Image.asset('assets/muscle_icons/triceps.png');
        }
        break;
      case "Upper Leg":
        {
          return Image.asset('assets/muscle_icons/upper_legs.png');
        }
        break;
      case "Lower Leg":
        {
          return Image.asset('assets/muscle_icons/calves.png');
        }
        break;
      default:
        {
          return Image.asset('assets/muscle_icons/chest.png');
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ds['name']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getMuscleIcon(widget.ds['muscleGroup']),
            Text(widget.ds['description']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sets'),
                SizedBox(width: 20),
                Text('Weight (kg)'),
                SizedBox(width: 20),
                Text('Reps'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1'),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '25'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '12'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1'),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '15'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '12'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1'),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '20'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: '12'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
