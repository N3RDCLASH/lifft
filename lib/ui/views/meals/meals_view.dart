import 'package:LIFFT/ui/views/meals/meals_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealsViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Center(
                child: Text("Meals"),
              ),
            ),
          );
        },
        viewModelBuilder: () => MealsViewModel());
  }
}
