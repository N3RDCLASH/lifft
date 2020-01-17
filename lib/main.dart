import 'package:LIFFT/screens/add_workoutday_screen.dart';
import 'package:LIFFT/screens/edit_workout_screen.dart';
import 'package:LIFFT/screens/workout_plan_detail_screen.dart';
import 'package:flutter/material.dart';
import './screens/create_workout_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LIFFT",
      home: Home(),
      onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/create_workout': (context) => CreateWorkout(),
          '/add_workout_day': (context) => AddWorkoutDay(),
          '/workout_plan_detail': (context) =>
              WorkoutPlanDetail(settings.arguments),
          '/edit_workout': (context) => EditWorkout(settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
