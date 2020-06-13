import 'package:LIFFT/services/authentication_service.dart';
import 'package:LIFFT/services/firestore_service.dart';
import 'package:injectable/injectable.dart';

import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdParyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  FirestoreService get firestoreService;
}
