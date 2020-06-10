import 'package:LIFFT/models/menu_item_model.dart';
import 'package:LIFFT/ui/views/account/account_view.dart';
import 'package:LIFFT/ui/views/account/account_viewmodel.dart';
import 'package:LIFFT/ui/views/meals/meals_view.dart';
import 'package:LIFFT/ui/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<MenuItem> _menuItems = [
    MenuItem(
      icon: Icon(Icons.account_circle),
      name: "Account",
      page: AccountView(),
    ),
    MenuItem(
      icon: Icon(Icons.calendar_today),
      name: "Meals",
      page: MealsView(),
    ),
    MenuItem(
      icon: Icon(Icons.fitness_center),
      name: "Workout",
      page: MealsView(),
    ),
  ];

  List<MenuItem> get menuItems => _menuItems;

  int _selectedMenuIndex = 0;
  int get selectedMenuIndex => _selectedMenuIndex;

  selectMenuItem(int index) {
    _selectedMenuIndex = index;
    notifyListeners();
  }
}
