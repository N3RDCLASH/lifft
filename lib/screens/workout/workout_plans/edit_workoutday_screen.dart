import 'package:LIFFT/models/workout_day_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditWorkoutDay extends StatefulWidget {
  final List args;

  EditWorkoutDay(this.args);

  @override
  _EditWorkoutDayState createState() => _EditWorkoutDayState();
}

class _EditWorkoutDayState extends State<EditWorkoutDay> {
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
  void initState() {
    super.initState();

    workoutNameController.text = widget.args[1].name;
    selectedDay = widget.args[1].day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit day"),
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
            RaisedButton(
              child: Text('Select day'),
              onPressed: () => _selectDate(context),
            ),
            Text('Selected Day: ${DateFormat('EEEE').format(_date)}'),
            RaisedButton(
              child: Text("Update"),
              onPressed: () {
                Map<String, String> wd = {
                  _date.toString(): workoutNameController.text,
                };

                WorkoutDay workoutDay = WorkoutDay(
                  name: workoutNameController.text,
                  day: _date.toString(),
                  workoutDay: wd,
                );

                List args = [];
                args.add(widget.args[0]);
                args.add(workoutDay);

                Navigator.pop(context, args);
              },
            )
          ],
        ),
      ),
    );
  }
}
