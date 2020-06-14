import 'dart:async';

import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/models/workout_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Collections
  final CollectionReference _userCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _workoutsColletectionReference =
      Firestore.instance.collection('workouts');

  //Streams
  final StreamController<List<Workout>> _workoutStreamController =
      StreamController<List<Workout>>.broadcast();

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

  Stream<List<Workout>> listenToWorkoutStream(String uid) {
    _workoutsColletectionReference
        .where('user', isEqualTo: uid)
        .snapshots()
        .listen((workoutSnpshot) {
      if (workoutSnpshot.documents.isNotEmpty) {
        var workouts = workoutSnpshot.documents
            .map(
              (snapshot) => Workout.fromMap(snapshot),
            )
            .where((mappedItem) => mappedItem.name != null)
            .toList();
        _workoutStreamController.add(workouts);
      }
    });

    return _workoutStreamController.stream;
  }
}
