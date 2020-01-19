import 'package:flutter/material.dart';

import 'training/training_screen.dart';
import 'workout_plans/workout_plans_screen.dart';

class Workout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff24324b),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: const Color(0xff3edfc2),
            child: SafeArea(
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.black,
                tabs: [
                  Tab(child: Text("Workout Plans")),
                  Tab(child: Text("Training")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            WorkoutPlan(),
            Training(),
          ],
        ),
      ),
    );
  }
}
