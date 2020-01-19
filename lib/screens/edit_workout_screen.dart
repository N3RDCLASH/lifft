import 'package:LIFFT/models/workout_day_model.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  _goToEditWorkoutDay(BuildContext context, List args) async {
    final result = await Navigator.pushNamed(
      context,
      '/edit_workout_day',
      arguments: args,
    );

    if (result != null) {
      List rslt = result;
      workoutDays.removeAt(rslt[0]);
      workoutDays.insert(rslt[0], rslt[1]);
    }
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
      WorkoutDay wd = WorkoutDay(
        day: k,
        name: v,
        workoutDay: {k: v},
      );

      workoutDays.add(wd);
    });
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are u sure?"),
          content: Text("This workoutday will be deleted permanently."),
          actions: <Widget>[
            FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                setState(() {
                  workoutDays.removeAt(index);
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    workoutDays.sort((a, b) {
      var adate = a.day;
      var bdate = b.day;
      return adate.compareTo(bdate);
    });

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
              workoutDays.sort((a, b) {
                var adate = a.day;
                var bdate = b.day;
                return adate.compareTo(bdate);
              });

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
                          return ListTile(
                            leading: Icon(Icons.edit),
                            title: Text(workoutDays[index].name),
                            subtitle: Text(DateFormat('EEEE').format(
                                DateTime.parse(workoutDays[index].day))),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                _showDeleteDialog(index);
                              },
                            ),
                            onTap: () {
                              List args = [];
                              args.add(index);
                              args.add(workoutDays[index]);
                              _goToEditWorkoutDay(context, args);
                            },
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
