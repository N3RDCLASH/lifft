import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogWorkout extends StatefulWidget {
  @override
  _LogWorkoutState createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  TextEditingController searchController = TextEditingController();
  String searchString;

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

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are u sure?"),
          content: Text("This workoutplan will be deleted permanently."),
          actions: <Widget>[
            FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                // try {
                //   Firestore.instance
                //       .collection('workout_plans')
                //       .document(ds.documentID)
                //       .delete();
                //   Navigator.pop(context);
                //   Navigator.pop(context);
                // } catch (e) {
                //   print(e.toString());
                // }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logging'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Search for exercises"),
              controller: searchController,
              onChanged: (val) {
                setState(() {
                  searchString = val.toLowerCase();
                });
              },
            ),
            RaisedButton(
              child: Text('add new exercise'),
              onPressed: () => Navigator.pushNamed(context, '/add_exercise'),
            ),
            StreamBuilder(
                stream: (searchString == null || searchString.trim() == "")
                    ? Firestore.instance.collection('exercises').snapshots()
                    : Firestore.instance
                        .collection('exercises')
                        .where('searchIndex', arrayContains: searchString)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading..");
                  }

                  return Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];

                          return ListTile(
                            leading: _getMuscleIcon(ds['muscleGroup']),
                            title: Text(ds['name']),
                            subtitle: Text(ds['description']),
                            onTap: _showDeleteDialog,
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
