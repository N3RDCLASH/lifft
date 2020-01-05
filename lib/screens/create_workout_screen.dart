import 'package:flutter/material.dart';

class CreateWorkout extends StatefulWidget {
  @override
  _CreateWorkoutState createState() => _CreateWorkoutState();
}

class WorkoutDay {
  String name;
  String day;
  // Key key;

}

class _CreateWorkoutState extends State<CreateWorkout> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController workoutNameController = new TextEditingController();
  bool stepOneComplete = false;

  String selectedDay;
  List<String> days = <String>[
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  List workoutDays = [
    "Meow",
    "Woof",
    "Mooooo",
    "Mihihi",
  ];

  void _addWorkoutDayModalSheet(context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: Text("hi"),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  child: Wrap(
                    children: <Widget>[
                      TextField(
                        controller: workoutNameController,
                        decoration: InputDecoration(
                          labelText: "New workout day name",
                          hintText: "Ex. Chest and triceps day",
                        ),
                      ),
                      DropdownButton<String>(
                        hint: Text("Select item"),
                        value: selectedDay,
                        onChanged: (String value) {
                          setState(() {
                            selectedDay = value;
                          });
                        },
                        items: days.map((String day) {
                          return DropdownMenuItem<String>(
                            value: day,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  day,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      RaisedButton(
                        child: Text("Save"),
                        onPressed: () {
                          setState(() {
                            workoutDays.add(workoutNameController.text);
                          });
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create workout'),
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
                      _addWorkoutDayModalSheet(context);
                    },
                  ),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        key: UniqueKey(),
                        itemCount: workoutDays.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(workoutDays[index]);
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
