import 'package:LIFFT/models/exercise_model.dart';
import 'package:LIFFT/models/workout_set_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String id;
  final String name;
  final String notes;
  final List<WorkoutSet> workout;

  Workout({this.notes, this.workout, this.id, this.name});

  static Workout fromMap(DocumentSnapshot snapshot) {
    if (snapshot.data == null) {
      return null;
    }
    List<WorkoutSet> sets = [];
    for (var item in snapshot.data['workout']) {
      sets.add(
        WorkoutSet(
          exercise: item['ex_id'],
          sets: item['sets'].toList(),
        ),
      );
    }

    return Workout(
        id: snapshot.documentID,
        name: snapshot.data['name'],
        notes: snapshot.data['notes'],
        workout: sets);
  }
}
