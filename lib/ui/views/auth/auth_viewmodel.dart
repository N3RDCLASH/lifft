import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final _formKey = new GlobalKey<FormState>();
  get formKey => _formKey;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void navigateToHome() {
    _navigationService.replaceWith(Routes.homeViewRoute);
  }

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

  void signIn(String email, String password) {
    if (!_formKey.currentState.validate()) {
      _snackbarService.showCustomSnackBar(
        title: "Error",
        message: "Invalid Login Credentails",
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
      return;
    } else {
      _authenticationService.logInWithEmail(email, password);
    }
  }

  navigateToSignUp() {
    _navigationService.navigateTo(Routes.registerViewRoute);
  }
}
