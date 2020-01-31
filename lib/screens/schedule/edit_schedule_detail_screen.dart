import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditScheduleDetail extends StatefulWidget {
  final DocumentSnapshot ds;

  EditScheduleDetail(this.ds);

  @override
  _EditScheduleDetailState createState() => _EditScheduleDetailState();
}

class _EditScheduleDetailState extends State<EditScheduleDetail> {
  void _updateWorkoutPlan(
    String workoutName,
    String workoutDesc,
    Map<String, String> workoutDays,
    DocumentSnapshot ds,
  ) async {
    try {
      Firestore.instance
          .collection('workout_plans')
          .document(ds.documentID)
          .updateData({
        'workoutName': workoutName,
        'workoutDesc': workoutDesc,
        'workoutDays': workoutDays,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit schedule detail'),
      ),
      body: Text('hi'),
    );
  }
}
