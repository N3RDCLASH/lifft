import 'package:LIFFT/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Text("hello"),
            ),
          );
        },
        viewModelBuilder: () => AuthViewModel());
  }
}
