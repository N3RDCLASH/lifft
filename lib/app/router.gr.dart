// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:LIFFT/ui/views/startup/startup_view.dart';
import 'package:LIFFT/ui/views/auth/auth_view.dart';

abstract class Routes {
  static const startupViewRoute = '/';
  static const authViewRoute = '/auth-view-route';
  static const all = {
    startupViewRoute,
    authViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartupView(),
          settings: settings,
        );
      case Routes.authViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AuthView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
