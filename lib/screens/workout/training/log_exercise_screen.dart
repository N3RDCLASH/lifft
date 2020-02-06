import 'package:LIFFT/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogExercise extends StatefulWidget {
  final List ds;

  LogExercise(this.ds);

  @override
  _LogExerciseState createState() => _LogExerciseState();
}

class _LogExerciseState extends State<LogExercise> {
  bool btnPressed = false;

  void _showConfirmDialog(String uid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Please review data"),
          content: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sets'),
                SizedBox(width: 20),
                Text('Weight (kg)'),
                SizedBox(width: 20),
                Text('Reps'),
              ],
            ),
            ...sets
          ]),
          actions: <Widget>[
            FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: btnPressed == false
                  ? Text("Save")
                  : CircularProgressIndicator(),
              onPressed: () {
                setState(() {
                  btnPressed = true;
                });

                List logs = [];

                for (int i = 0; i < weightControllers.length; i++) {
                  Map setMap = {
                    'set': i + 1,
                    'weight': weightControllers[i].text,
                    'reps': repsControllers[i].text,
                  };

                  logs.add(setMap);
                }

                Firestore.instance.collection('logs').add({
                  'uid': uid,
                  'exercise': widget.ds[0]['name'],
                  'date': DateTime.now(),
                  'logs': logs,
                  'workoutName': widget.ds[1]['workoutName'],
                  'workoutDay': widget.ds[2],
                }).then((onValue) {
                  print('log created ${onValue.documentID}');
                  Navigator.pop(context);
                  Navigator.pop(context);
                }).catchError((onError) => print(onError));
              },
            ),
          ],
        );
      },
    );
  }

  _getMuscleIcon(String muscleGroup) {
    switch (muscleGroup) {
      case "Abs":
        {
          return Image.asset('assets/muscle_icons/abs.png');
        }
        break;
      case "Back":
        {
          return Image.asset('assets/muscle_icons/back.png');
        }
        break;
      case "Biceps":
        {
          return Image.asset('assets/muscle_icons/biceps.png');
        }
        break;
      case "Chest":
        {
          return Image.asset('assets/muscle_icons/chest.png');
        }
        break;
      case "Forearms":
        {
          return Image.asset('assets/muscle_icons/biceps.png');
        }
        break;
      case "Glutes":
        {
          return Image.asset('assets/muscle_icons/glutes.png');
        }
        break;
      case "Shoulders":
        {
          return Image.asset('assets/muscle_icons/shoulders.png');
        }
        break;
      case "Triceps":
        {
          return Image.asset('assets/muscle_icons/triceps.png');
        }
        break;
      case "Upper Leg":
        {
          return Image.asset('assets/muscle_icons/upper_legs.png');
        }
        break;
      case "Lower Leg":
        {
          return Image.asset('assets/muscle_icons/calves.png');
        }
        break;
      default:
        {
          return Image.asset('assets/muscle_icons/chest.png');
        }
    }
  }

  static TextEditingController wCtrl1 = TextEditingController();
  static TextEditingController wCtrl2 = TextEditingController();
  static TextEditingController wCtrl3 = TextEditingController();

  static TextEditingController rCtrl1 = TextEditingController();
  static TextEditingController rCtrl2 = TextEditingController();
  static TextEditingController rCtrl3 = TextEditingController();

  List weightControllers = [];
  List repsControllers = [];

  void initState() {
    super.initState();

    weightControllers.add(wCtrl1);
    weightControllers.add(wCtrl2);
    weightControllers.add(wCtrl3);

    repsControllers.add(rCtrl1);
    repsControllers.add(rCtrl2);
    repsControllers.add(rCtrl3);
  }

  List<Widget> sets = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('1'),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: wCtrl1,
            decoration: InputDecoration(hintText: '10'),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: rCtrl1,
            decoration: InputDecoration(hintText: '12'),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('2'),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: wCtrl2,
            decoration: InputDecoration(hintText: '15'),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: rCtrl2,
            decoration: InputDecoration(hintText: '12'),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('3'),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: wCtrl3,
            decoration: InputDecoration(hintText: '20'),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: TextField(
            controller: rCtrl3,
            decoration: InputDecoration(hintText: '12'),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    ),
  ];

  int setCount = 3;

  _addNewSet() {
    setState(() {
      setCount++;
      TextEditingController wCtr = TextEditingController();
      TextEditingController rCtr = TextEditingController();

      weightControllers.add(wCtr);
      repsControllers.add(rCtr);

      sets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$setCount'),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: wCtr,
                decoration: InputDecoration(hintText: '20'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: rCtr,
                decoration: InputDecoration(hintText: '12'),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ds[0]['name']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getMuscleIcon(widget.ds[0]['muscleGroup']),
            Text(widget.ds[0]['description']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sets'),
                SizedBox(width: 20),
                Text('Weight (kg)'),
                SizedBox(width: 20),
                Text('Reps'),
              ],
            ),
            ...sets,
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text('new set'),
                    ],
                  ),
                  onPressed: _addNewSet,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (sets.isNotEmpty &&
                          weightControllers.isNotEmpty &&
                          repsControllers.isNotEmpty) {
                        sets.remove(sets.last);
                        weightControllers.remove(weightControllers.last);
                        repsControllers.remove(repsControllers.last);
                      }
                    });
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('Log set & rest'),
              onPressed: () => _showConfirmDialog(user.uid),
            ),
          ],
        ),
      ),
    );
  }
}
