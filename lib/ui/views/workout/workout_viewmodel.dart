import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:LIFFT/models/workout_model.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:LIFFT/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutViewModel extends StreamViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Stream<List<Workout>> get stream => _firestoreService
      .listenToWorkoutStream(_authenticationService.currentUser.id);
}
