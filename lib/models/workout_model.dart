import 'package:LIFFT/models/exercise_model.dart';
import 'package:LIFFT/models/workout_set_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String id;
  final String name;
  final String notes;
  final List<WorkoutSet> workout;

  Workout({this.notes, this.workout, this.id, this.name});

  static Workout fromMap(DocumentSnapshot workoutSnapshot) {
    if (workoutSnapshot.data == null) {
      return null;
    }
    List<WorkoutSet> sets = [];
    for (var item in workoutSnapshot.data['workout']) {
      sets.add(
        WorkoutSet(
          exercise: Exercise(
            id: item['ex_id'],
          ),
          sets: item['sets'].toList(),
        ),
      );
    }

    return Workout(
        id: workoutSnapshot.documentID,
        name: workoutSnapshot.data['name'],
        notes: workoutSnapshot.data['notes'],
        workout: sets);
  }

  @override
  String toString() {
    return "Workout: ${workout[0].exercise.toString()}";
  }
}
