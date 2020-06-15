import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/models/exercise_model.dart';
import 'package:LIFFT/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ExercisesViewModel extends StreamViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();
  TextEditingController _searchTextEditingController = TextEditingController();
  TextEditingController get searchTextEditingController =>
      _searchTextEditingController;

  List<Exercise> _exerciseList;
  List<Exercise> get exerciseList => _exerciseList;
  @override
  Stream<List<Exercise>> get stream =>
      _firestoreService.listenToExerciseStream();
  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  void onData(data) {
    super.onData(data);
    _exerciseList = data;
  }

  filterExercises(String val) {
    _exerciseList = data
        .where((Exercise exercise) => (exercise.name
            .toLowerCase()
            .contains(_searchTextEditingController.text.toLowerCase())))
        .toList();
    notifyListeners();
  }
}
