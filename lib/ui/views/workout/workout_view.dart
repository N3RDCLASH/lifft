import 'package:LIFFT/models/workout_model.dart';
import 'package:LIFFT/models/workout_set_model.dart';
import 'package:LIFFT/style/theme.dart';
import 'package:LIFFT/ui/views/startup/startup_viewmodel.dart';
import 'package:LIFFT/ui/views/workout/workout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WorkoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutViewModel>.reactive(
        builder: (context, model, child) => Container(
              color: background_color1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Workout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    height: 50,
                    color: main_color1,
                    minWidth: MediaQuery.of(context).size.width,
                    child: Text(
                      "Start new workout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Saved Workouts",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (model.isBusy)
                    CircularProgressIndicator()
                  else if (model.data != null)
                    for (var workout in model.data) WorkoutCard(workout)
                ],
              ),
            ),
        viewModelBuilder: () => WorkoutViewModel());
  }
}

class WorkoutCard extends ViewModelWidget<WorkoutViewModel> {
  final Workout _workout;

  WorkoutCard(this._workout);
  @override
  Widget build(BuildContext context, WorkoutViewModel model) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _workout.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Align(
                      child: IconButton(
                          icon: Icon(Icons.more_vert), onPressed: () {}))
                ],
              ),
              if (!model.isBusy)
                for (WorkoutSet workoutSet in _workout.workout)
                  Text(
                      "${workoutSet.sets.length} x ${workoutSet.exercise.name}")
            ],
          )),
    );
  }
}
