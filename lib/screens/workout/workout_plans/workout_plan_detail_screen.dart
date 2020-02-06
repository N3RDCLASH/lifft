import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkoutPlanDetail extends StatefulWidget {
  final WorkoutPlanModel planModel;

  WorkoutPlanDetail(this.planModel);

  @override
  _WorkoutPlanDetailState createState() => _WorkoutPlanDetailState();
}

class _WorkoutPlanDetailState extends State<WorkoutPlanDetail> {
  bool selected = false;

  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection('workout_plans')
        .document(widget.planModel.ds)
        .get()
        .then((doc) {
      if (doc['activeWorkout'] == true) {
        setState(() {
          selected = true;
        });
      } else {
        setState(() {
          selected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    widget.planModel.workoutDays.sort((a, b) {
      var adate = a.day;
      var bdate = b.day;
      return adate.compareTo(bdate);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.planModel.workoutName),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: selected == false
                ? RaisedButton(
                    child: Text("Select plan"),
                    onPressed: () {
                      setState(() {
                        selected = true;
                      });
                      Firestore.instance
                          .collection("workout_plans")
                          .where('uid', isEqualTo: user.uid)
                          .getDocuments()
                          .then(
                        (QuerySnapshot snapshot) {
                          snapshot.documents.forEach((doc) {
                            try {
                              Firestore.instance
                                  .collection('workout_plans')
                                  .document(doc.documentID)
                                  .updateData({
                                'activeWorkout':
                                    widget.planModel.ds == doc.documentID
                                        ? true
                                        : false
                              });
                            } catch (e) {
                              print(e.toString());
                            }
                          });
                        },
                      );
                    },
                  )
                : Text(
                    'This is your current active workout plan \n Select another one to deactivate this.'),
          ),
          Center(
            child: Text("Description: " + widget.planModel.workoutDesc),
          ),
          Center(
            child: Text(
                "Active workout: " + widget.planModel.activeWorkout.toString()),
          ),
          Expanded(
            child: widget.planModel.workoutDays.isEmpty
                ? Text("no days")
                : ListView.builder(
                    itemCount: widget.planModel.workoutDays.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Text(
                          widget.planModel.workoutDays[index].name +
                              " " +
                              DateFormat('EEEE').format(DateTime.parse(
                                  widget.planModel.workoutDays[index].day)),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
