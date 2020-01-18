import 'package:LIFFT/models/workout_day_model.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditWorkout extends StatefulWidget {
  final DocumentSnapshot ds;

  EditWorkout(this.ds);

  @override
  _EditWorkoutState createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout> {
  @override
  EditWorkout get widget => super.widget;

  TextEditingController nameController = new TextEditingController();

  TextEditingController descController = new TextEditingController();

  bool stepOneComplete = false;

  List workoutDays = [];

  Map days;

  _goToAddWorkoutDay(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add_workout_day');

    if (result != null) workoutDays.add(result);
  }

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
        'activeWorkout': false
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    nameController.text = widget.ds['workoutName'];
    descController.text = widget.ds['workoutDesc'];
    days = widget.ds['workoutDays'];

    days.forEach((k, v) {
      // print(k + v);
      WorkoutDay wd = WorkoutDay(
        day: k,
        name: v,
        workoutDay: {k: v},
      );

      workoutDays.add(wd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit workout'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Text("Update"),
                Icon(Icons.update),
              ],
            ),
            onPressed: () {
              WorkoutPlanModel plan = WorkoutPlanModel(
                workoutName: nameController.text,
                workoutDesc: descController.text,
                activeWorkout: false,
                workoutDays: workoutDays,
              );

              Map<String, String> workoutDaysMap = {};
              plan.workoutDays.forEach((i) {
                workoutDaysMap.addAll(i.workoutDay);
              });

              _updateWorkoutPlan(
                plan.workoutName,
                plan.workoutDesc,
                workoutDaysMap,
                widget.ds,
              );

              Navigator.pop(context, plan);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Step one: Plan description"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Workout Name",
                hintText: "Ex. 10 weeks muscle building",
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Enter your workout's description",
              ),
            ),
            Text("Step two: Finalize plan"),
            Text(nameController.text),
            RaisedButton(
              child: Text("Add days to this workout"),
              onPressed: () {
                _goToAddWorkoutDay(context);
              },
            ),
            Center(
              child: Container(
                height: 500,
                child: workoutDays.isEmpty
                    ? Text("No days added yet :(")
                    : ListView.builder(
                        itemCount: workoutDays.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(workoutDays[index].name);
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
