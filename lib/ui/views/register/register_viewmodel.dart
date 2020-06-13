import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final _formKey = new GlobalKey<FormState>();
  get formKey => _formKey;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  validateEmail(String value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "";
    }
  }

  validatePassword(String value) {
    if (value.length < 6) {
      print("123");
      return "";
    }
  }

  void togglePassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }
}
