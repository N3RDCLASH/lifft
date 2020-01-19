class WorkoutPlanModel {
  String workoutName;
  String workoutDesc;
  bool activeWorkout;
  List workoutDays;
  var ds;

  WorkoutPlanModel({
    this.workoutName,
    this.workoutDesc,
    this.activeWorkout,
    this.workoutDays,
    this.ds,
  });
}
