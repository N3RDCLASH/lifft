import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

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

  Future signUp(
      {String email, String password, String fistName, String lastName}) async {
    String fullName = "$fistName $lastName";
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(
        email.trim().toLowerCase(), password, fullName.trim().toLowerCase());
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.replaceWith(Routes.homeViewRoute);
      } else {
        _snackbarService.showCustomSnackBar(
          title: "Error",
          message: "Sign up failure",
          isDismissible: true,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      _snackbarService.showCustomSnackBar(
        title: "Error",
        message: result,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }
}
