import 'package:LIFFT/models/workout_day_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddWorkoutDay extends StatefulWidget {
  @override
  _AddWorkoutDayState createState() => _AddWorkoutDayState();
}

class _AddWorkoutDayState extends State<AddWorkoutDay> {
  TextEditingController workoutNameController = new TextEditingController();

  // String selectedDay;

  // List<String> days = <String>[
  //   "Monday",
  //   "Tuesday",
  //   "Wednesday",
  //   "Thursday",
  //   "Friday",
  //   "Saturday",
  //   "Sunday"
  // ];

  DateTime _date = DateTime.now();

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _date = picked;
        print(DateFormat('EEEE').format(_date));
      });
    }
  }

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
            // DropdownButton<String>(
            //   hint: Text("Select item"),
            //   value: selectedDay,
            //   onChanged: (String value) {
            //     setState(() {
            //       selectedDay = value;
            //     });
            //   },
            //   items: days.map((String day) {
            //     return DropdownMenuItem<String>(
            //       value: day,
            //       child: Row(
            //         children: <Widget>[
            //           Text(
            //             day,
            //             style: TextStyle(color: Colors.black),
            //           ),
            //         ],
            //       ),
            //     );
            //   }).toList(),
            // ),
            RaisedButton(
              child: Text('Select day'),
              onPressed: () => _selectDate(context),
            ),
            Text('Selected Day: ${DateFormat('EEEE').format(_date)}'),
            RaisedButton(
              child: Text("Add"),
              onPressed: () {
                Map<String, String> wd = {
                  _date.toString(): workoutNameController.text,
                };

                WorkoutDay workoutDay = WorkoutDay(
                  name: workoutNameController.text,
                  day: _date.toString(),
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
