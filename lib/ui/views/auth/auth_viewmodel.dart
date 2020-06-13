import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final _formKey = new GlobalKey<FormState>();
  get formKey => _formKey;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void navigateToHome() {
    _navigationService.replaceWith(Routes.homeViewRoute);
  }

  validateEmail(String value) {}

  validatePassword(String value) {}

  void togglePassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }

  void signIn(String email, String password) {
    _authenticationService.logInWithEmail(email, password);
  }
}
