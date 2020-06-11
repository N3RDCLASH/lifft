import 'package:LIFFT/app/locator.dart';
import 'package:LIFFT/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) {
      runApp(new Lifft());
    });
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
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
