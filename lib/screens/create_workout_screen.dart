import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                    WorkoutPlanModel plan = WorkoutPlanModel(
                      workoutName: nameController.text,
                      workoutDesc: descController.text,
                      workoutDays: workoutDays,
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
                                return workoutDays[index];
                              }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
