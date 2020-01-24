import 'package:LIFFT/models/exercise_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String selectedMuscleGroup;

  List<String> muscleGroups = <String>[
    "Abs",
    "Back",
    "Biceps",
    "Chest",
    "Forearms",
    "Glutes",
    "Shoulders",
    "Triceps",
    "Upper Leg",
    "Lower Leg",
  ];

  bool btnPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new exercise"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "New exercise name",
                hintText: "Ex. Barbell Bench Press",
              ),
            ),
            DropdownButton<String>(
              hint: Text("Select muscle group"),
              value: selectedMuscleGroup,
              onChanged: (String value) {
                setState(() {
                  selectedMuscleGroup = value;
                });
              },
              items: muscleGroups.map((String day) {
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
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Exercise Description",
                hintText: "Enter a description...",
              ),
            ),
            RaisedButton(
              child: btnPressed == false
                  ? Text("Add")
                  : CircularProgressIndicator(),
              onPressed: () {
                setState(() {
                  btnPressed = true;
                });

                Exercise exercise = Exercise(
                  name: nameController.text,
                  description: descController.text,
                  muscleGroup: selectedMuscleGroup,
                  imgUrl: '',
                );

                String searchString =
                    "${exercise.name} ${exercise.description} ${exercise.muscleGroup}";

                List splitList = [];
                splitList = searchString.split(" ");

                List indexList = [];

                for (int i = 0; i < splitList.length; i++) {
                  for (int y = 1; y < splitList[i].length + 1; y++) {
                    indexList.add(splitList[i].substring(0, y).toLowerCase());
                  }
                }

                Firestore.instance.collection('exercises').add({
                  'name': exercise.name,
                  'description': exercise.description,
                  'muscleGroup': exercise.muscleGroup,
                  "searchIndex": indexList,
                }).then((onValue) {
                  Navigator.pop(context);

                  print('new exercise created at ${onValue.documentID}');
                }).catchError((onError) => print(onError));
              },
            )
          ],
        ),
      ),
    );
  }
}
