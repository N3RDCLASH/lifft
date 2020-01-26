import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogExercise extends StatefulWidget {
  final DocumentSnapshot ds;

  LogExercise(this.ds);

  @override
  _LogExerciseState createState() => _LogExerciseState();
}

class _LogExerciseState extends State<LogExercise> {
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

  List setMaps = List(100);

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
  List controllers = [];

  _addNewSet() {
    setState(() {
      setCount++;
      TextEditingController ctr = TextEditingController();

      controllers.add(ctr);

      sets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$setCount'),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: ctr,
                decoration: InputDecoration(hintText: '20'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ds['name']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getMuscleIcon(widget.ds['muscleGroup']),
            Text(widget.ds['description']),
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
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('new set'),
                ],
              ),
              onPressed: _addNewSet,
            ),
            RaisedButton(
              child: Text('Log set & rest'),
              onPressed: () {
                // try {
                //   Firestore.instance.collection('logs').add({
                //     'exercise': widget.ds['name'],

                //   });
                // } catch (e) {
                //   print(e);
                // }

                setMaps[0] = {
                  'set': 1,
                  'weight': wCtrl1.text,
                  'reps': rCtrl1.text,
                };

                setMaps[1] = {
                  'set': 2,
                  'weight': wCtrl2.text,
                  'reps': rCtrl2.text,
                };

                setMaps[2] = {
                  'set': 3,
                  'weight': wCtrl3.text,
                  'reps': rCtrl3.text,
                };

                // print(setMaps);
                print(sets[0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
