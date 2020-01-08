import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:flutter/material.dart';

class WorkoutPlanDetail extends StatelessWidget {
  final WorkoutPlanModel planModel;

  WorkoutPlanDetail(this.planModel);

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: planModel.workoutDays.isEmpty
                ? Text("no days")
                : ListView.builder(
                    itemCount: planModel.workoutDays.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: planModel.workoutDays[index],
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
