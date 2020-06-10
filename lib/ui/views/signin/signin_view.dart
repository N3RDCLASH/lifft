import 'package:LIFFT/ui/views/signin/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold();
        },
        viewModelBuilder: () => SignInViewModel());
  }
}
