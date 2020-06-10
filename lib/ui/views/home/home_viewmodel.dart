import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:LIFFT/models/menu_item_model.dart';
import 'package:LIFFT/services/authentication_service.dart';
import 'package:LIFFT/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../screens/account/account_screen.dart';
import '../../../screens/meals_screen.dart';
import '../../../screens/schedule/schedule_screen.dart';
import '../../../screens/workout/workout_screen.dart';

class HomeViewModel extends BaseViewModel {
  List<MenuItem> _menuItems = [
    MenuItem(
      icon: Icon(Icons.calendar_today),
      name: "Meals",
      page: StartupView(),
    ),
    MenuItem(
      icon: Icon(Icons.fitness_center),
      name: "Workout",
      page: StartupView(),
    ),
    MenuItem(
      icon: Icon(Icons.account_circle),
      name: "Account",
      page: StartupView(),
    ),
  ];

  List<MenuItem> get menuItems => _menuItems;
}
