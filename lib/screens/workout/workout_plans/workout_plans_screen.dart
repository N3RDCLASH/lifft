import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/models/workout_day_model.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  void _showDeleteDialog(DocumentSnapshot ds) {
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
                try {
                  Firestore.instance
                      .collection('workout_plans')
                      .document(ds.documentID)
                      .delete();
                  Navigator.pop(context);
                  Navigator.pop(context);
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: const Color(0xff24324b),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('workout_plans')
            .where('uid', isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return ListTile(
                  leading: Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                  ),
                  trailing: PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: FlatButton(
                          child: Text('Edit'),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/edit_workout',
                              arguments: ds,
                            );
                          },
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: FlatButton(
                          child: Text('Delete'),
                          onPressed: () {
                            _showDeleteDialog(ds);
                          },
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    ds['workoutName'],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    ds['workoutDesc'],
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    List wds = [];

                    ds['workoutDays'].forEach((k, v) {
                      WorkoutDay wd =
                          new WorkoutDay(day: k, name: v, workoutDay: {k: v});
                      wds.add(wd);
                    });

                    WorkoutPlanModel planModel = new WorkoutPlanModel(
                      workoutName: ds['workoutName'],
                      workoutDesc: ds['workoutDesc'],
                      activeWorkout: ds['activeWorkout'],
                      workoutDays: wds,
                      ds: ds.documentID,
                    );

                    Navigator.of(context).pushNamed(
                      '/workout_plan_detail',
                      arguments: planModel,
                    );
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create_workout');
        },
      ),
    );
  }
}
