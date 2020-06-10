import 'package:LIFFT/ui/views/home/home_viewmodel.dart';
import 'package:LIFFT/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body:
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
