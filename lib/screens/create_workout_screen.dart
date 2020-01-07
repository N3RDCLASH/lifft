import 'package:LIFFT/screens/add_workoutday_screen.dart';
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
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWorkoutDay()),
    );

    workoutDays.add(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create workout'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Text("Create"),
                Icon(Icons.save),
              ],
            ),
            onPressed: () {},
          )
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
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: workoutDays.length,
                        itemBuilder: (BuildContext context, int index) {
                          return workoutDays.isEmpty
                              ? Text("No days added yet :(")
                              : workoutDays[index];
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
