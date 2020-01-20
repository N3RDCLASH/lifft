import 'package:LIFFT/models/workout_day_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List wds = [];

  _getWorkoutDays(var ds) {
    List<Widget> days = [];
    List<WorkoutDay> d = [];
    ds['workoutDays'].forEach((k, v) {
      WorkoutDay wd = WorkoutDay(day: k, name: v, workoutDay: {k: v});
      d.add(wd);
    });

    d.sort((a, b) {
      var adate = a.day;
      var bdate = b.day;
      return adate.compareTo(bdate);
    });

    d.forEach((d) => days.add(RaisedButton(
          child: Text(
            '${DateFormat('EEEE').format(DateTime.parse(d.day))}: ${d.name}',
            // style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/log_workout');
          },
        )));

    return days;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('workout_plans')
            .where('activeWorkout', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }

          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot ds = snapshot.data.documents[index];

                return Column(
                  children: <Widget>[
                    Text(
                      'Current plan : ' + ds['workoutName'],
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Description : ' + ds['workoutDesc'],
                      style: TextStyle(color: Colors.white),
                    ),
                    ..._getWorkoutDays(ds),
                  ],
                );
              });
        });
  }
}
