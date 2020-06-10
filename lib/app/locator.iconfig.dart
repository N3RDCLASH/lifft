// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:LIFFT/services/third_party_services_module.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdParyServicesModule = _$ThirdParyServicesModule();
  g.registerLazySingleton<AuthenticationService>(
      () => thirdParyServicesModule.authenticationService);
  g.registerLazySingleton<DialogService>(
      () => thirdParyServicesModule.dialogService);
  g.registerLazySingleton<NavigationService>(
      () => thirdParyServicesModule.navigationService);
}

class _$ThirdParyServicesModule extends ThirdParyServicesModule {
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
