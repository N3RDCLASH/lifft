import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './screens/home_screen.dart';
import 'screens/workout/training/add_exercise_screen.dart';
import 'screens/workout/training/log_workout_screen.dart';
import 'screens/workout/workout_plans/add_workoutday_screen.dart';
import 'screens/workout/workout_plans/create_workout_screen.dart';
import 'screens/workout/workout_plans/edit_workout_screen.dart';
import 'screens/workout/workout_plans/edit_workoutday_screen.dart';
import 'screens/workout/workout_plans/workout_plan_detail_screen.dart';
import 'screens/workout/training/log_exercise_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

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
          '/edit_workout_day': (context) => EditWorkoutDay(settings.arguments),
          '/log_workout': (context) => LogWorkout(),
          '/add_exercise': (context) => AddExercise(),
          '/log_exercise': (context) => LogExercise(settings.arguments),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
