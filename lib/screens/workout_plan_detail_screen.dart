import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutPlanDetail extends StatelessWidget {
  final WorkoutPlanModel planModel;

  WorkoutPlanDetail(this.planModel);

  @override
  Widget build(BuildContext context) {
    planModel.workoutDays.sort((a, b) {
      var adate = a.day;
      var bdate = b.day;
      return adate.compareTo(bdate);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(planModel.workoutName),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("Select plan"),
              onPressed: () {},
            ),
          ),
          Center(
            child: Text("Description: " + planModel.workoutDesc),
          ),
          Center(
            child:
                Text("Active workout: " + planModel.activeWorkout.toString()),
          ),
          Expanded(
            child: planModel.workoutDays.isEmpty
                ? Text("no days")
                : ListView.builder(
                    itemCount: planModel.workoutDays.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Text(
                          planModel.workoutDays[index].name +
                              " " +
                              DateFormat('EEEE').format(DateTime.parse(
                                  planModel.workoutDays[index].day)),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
