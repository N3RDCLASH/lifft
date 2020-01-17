import 'package:LIFFT/models/workout_day_model.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24324b),
      body: StreamBuilder(
        stream: Firestore.instance.collection('workout_plans').snapshots(),
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
                            print(ds.documentID);
                            try {
                              Firestore.instance
                                  .collection('workout_plans')
                                  .document(ds.documentID)
                                  .delete();
                              Navigator.pop(context);
                            } catch (e) {
                              print(e.toString());
                            }
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
