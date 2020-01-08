import 'package:LIFFT/models/workout_plan_model.dart';
import 'package:flutter/material.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  List<WorkoutPlanModel> workoutPlans = [];

  _goToCreateWorkout(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/create_workout');

    workoutPlans.add(result);
    workoutPlans.forEach((plan) => print(plan.workoutName));
  }

  @override
  Widget build(BuildContext context) {
    return workoutPlans.isEmpty
        ? Container(
            child: RaisedButton(
              color: const Color(0xff24324b),
              child: Text(
                'Tap here to create a new workout plan',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                _goToCreateWorkout(context);
              },
            ),
          )
        : Column(
            children: <Widget>[
              Container(
                child: RaisedButton(
                  // color: const Color(0xff24324b),
                  color: Colors.blue,
                  child: Text(
                    'Tap here to create a new workout plan',
                    style: TextStyle(
                      color: Colors.white,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    _goToCreateWorkout(context);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: workoutPlans.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FlatButton(
                        child: Text(
                          workoutPlans[index].workoutName,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/workout_plan_detail',
                            arguments: workoutPlans[index],
                          );
                        },
                      );
                    }),
              ),
            ],
          );
  }
}
