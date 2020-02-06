import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateWorkout extends StatefulWidget {
  @override
  _CreateWorkoutState createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  bool stepOneComplete = false;

  List workoutDays = [];

  _goToAddWorkoutDay(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add_workout_day');

    if (result != null) workoutDays.add(result);
  }

  void _createWorkoutPlan(
    String uid,
    String workoutName,
    String workoutDesc,
    Map<String, String> workoutDays,
  ) async {
    DocumentReference ref =
        await Firestore.instance.collection("workout_plans").add({
      'uid': uid,
      'workoutName': workoutName,
      'workoutDesc': workoutDesc,
      'workoutDays': workoutDays,
      'activeWorkout': false
    });
    print('New workout plan created ${ref.documentID}');
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    workoutDays.sort((a, b) {
      var adate = a.day;
      var bdate = b.day;
      return adate.compareTo(bdate);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Create workout'),
        actions: <Widget>[
          stepOneComplete
              ? RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Text("Create"),
                      Icon(Icons.save),
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

                    print(workoutDaysMap);

                    _createWorkoutPlan(
                      user.uid,
                      plan.workoutName,
                      plan.workoutDesc,
                      workoutDaysMap,
                    );

                    Navigator.pop(context, plan);
                  },
                )
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: stepOneComplete == false
            ? Column(
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
                  RaisedButton(
                    child: Text("Next"),
                    onPressed: () {
                      setState(() {
                        stepOneComplete = true;
                      });
                    },
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Back"),
                    onPressed: () {
                      setState(() {
                        stepOneComplete = false;
                      });
                    },
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
                                  // leading: Icon(Icons.edit),
                                  title: Text(workoutDays[index].name),
                                  subtitle: Text(DateFormat('EEEE').format(
                                      DateTime.parse(workoutDays[index].day))),
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
