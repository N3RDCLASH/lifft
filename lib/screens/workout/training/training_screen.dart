import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  Map wp;

  @override
  void initState() {
    super.initState();

    Firestore.instance.collection("workout_plans").getDocuments().then(
      (QuerySnapshot snapshot) {
        snapshot.documents.forEach((doc) {
          try {
            Firestore.instance
                .collection('workout_plans')
                .document(doc.documentID)
                .get()
                .then((d) {
              if (d.data['activeWorkout'] == true) {
                setState(() {
                  wp = d.data;
                });
              } else {
                setState(() {
                  wp = null;
                });
              }
            });
          } catch (e) {
            print(e.toString());
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return wp == null
        ? Text('loading')
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Current plan: ' + wp['workoutName'],
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Description: ' + wp['workoutDesc'],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
  }
}
