import 'dart:async';

import 'package:LIFFT/models/exercise_model.dart';
import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/models/workout_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Collections
  final CollectionReference _userCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _workoutsColletectionReference =
      Firestore.instance.collection('workouts');
  final CollectionReference _exerciseColletectionReference =
      Firestore.instance.collection('exercises');

  //Streams
  final StreamController<List<Workout>> _workoutsStreamController =
      StreamController<List<Workout>>.broadcast();
  final StreamController<List<Exercise>> _exerciseStreamController =
      StreamController<List<Exercise>>.broadcast();
  final StreamController<Exercise> _singleExerciseStreamController =
      StreamController<Exercise>.broadcast();
  Future createUser(User user) async {
    try {
      await _userCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  //Stream for all workouts of logged in user
  Stream<List<Workout>> listenToWorkoutStream(String uid) {
    _workoutsColletectionReference
        .where('user', isEqualTo: uid)
        .snapshots()
        .listen((workoutSnpshot) async {
      if (workoutSnpshot.documents.isNotEmpty) {
        List<Workout> workouts = workoutSnpshot.documents
            .map((snapshot) => Workout.fromMap(snapshot))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        try {
          for (var workout in workouts) {
            for (var workoutSet in workout.workout) {
              try {
                Exercise exercise = await getExercise(workoutSet.exercise.id);

                workoutSet.exercise = exercise;
              } catch (e) {
                print(e);
              }
            }
            workout.workout.forEach((workoutSet) async {});
          }
          _workoutsStreamController.add(workouts);
        } catch (e) {}
      }
    });

    return _workoutsStreamController.stream;
  }

  //Stream for all exercises
  Stream<List<Exercise>> listenToExerciseStream() {
    _exerciseColletectionReference.snapshots().listen((exerciseSnapshot) {
      if (exerciseSnapshot.documents.isNotEmpty) {
        List<Exercise> exercises = exerciseSnapshot.documents
            .map((snapshot) => Exercise.fromMap(snapshot))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        _exerciseStreamController.add(exercises);
      }
    });
  }

  Future<Exercise> getExercise(String id) async {
    try {
      var snapshot = await _exerciseColletectionReference.document(id).get();
      return Exercise.fromMap(snapshot);
    } catch (e) {
      return e;
    }
  }
}
