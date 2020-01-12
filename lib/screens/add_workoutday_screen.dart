import 'package:LIFFT/models/workout_day_model.dart';
import 'package:flutter/material.dart';

class AddWorkoutDay extends StatefulWidget {
  @override
  _AddWorkoutDayState createState() => _AddWorkoutDayState();
}

class _AddWorkoutDayState extends State<AddWorkoutDay> {
  TextEditingController workoutNameController = new TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new day"),
      ),
      body: SafeArea(
        child: Column(
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
                Map<String, String> wd = {
                  selectedDay: workoutNameController.text,
                };

                WorkoutDay workoutDay = WorkoutDay(
                  name: workoutNameController.text,
                  day: selectedDay,
                  workoutDay: wd,
                );

                Navigator.pop(context, workoutDay);
              },
            )
          ],
        ),
      ),
    );
  }
}
