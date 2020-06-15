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
  @override
  Stream<List<Exercise>> get stream =>
      _firestoreService.listenToExerciseStream();
  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }
}
