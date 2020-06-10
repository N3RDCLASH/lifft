import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/screens/schedule/schedule_detail_screen.dart';
import 'package:LIFFT/services/auth.dart';
import 'package:LIFFT/services/wrapper.dart';
import 'package:LIFFT/ui/views/auth/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'screens/schedule/edit_schedule_detail_screen.dart';
import 'screens/workout/training/add_exercise_screen.dart';
import 'screens/workout/training/log_workout_screen.dart';
import 'screens/workout/workout_plans/add_workoutday_screen.dart';
import 'screens/workout/workout_plans/create_workout_screen.dart';
import 'screens/workout/workout_plans/edit_workout_screen.dart';
import 'screens/workout/workout_plans/edit_workoutday_screen.dart';
import 'screens/workout/workout_plans/workout_plan_detail_screen.dart';
import 'screens/workout/training/log_exercise_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(new Lifft()));
  });
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         title: "LIFFT",
//         home: Wrapper(),
//         onGenerateRoute: (RouteSettings settings) {
//           print('build route for ${settings.name}');
//           var routes = <String, WidgetBuilder>{
//             '/create_workout': (context) => CreateWorkout(),
//             '/add_workout_day': (context) => AddWorkoutDay(),
//             '/workout_plan_detail': (context) =>
//                 WorkoutPlanDetail(settings.arguments),
//             '/edit_workout': (context) => EditWorkout(settings.arguments),
//             '/edit_workout_day': (context) =>
//                 EditWorkoutDay(settings.arguments),
//             '/log_workout': (context) => LogWorkout(settings.arguments),
//             '/add_exercise': (context) => AddExercise(),
//             '/log_exercise': (context) => LogExercise(settings.arguments),
//             '/schedule_detail': (context) => ScheduleDetail(settings.arguments),
//             '/edit_schedule_detail': (context) =>
//                 EditScheduleDetail(settings.arguments),
//           };
//           WidgetBuilder builder = routes[settings.name];
//           return MaterialPageRoute(builder: (ctx) => builder(ctx));
//         },
//       ),
//     );
//   }
// }

class Lifft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      home: AuthView(),
    );
  }
}
