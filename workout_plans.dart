import 'manage_plans.dart';

class Workouts implements ManagePlans {
  String? w_name;
  String? body_part;
  int? sets;
  int? reps;

  @override
  void createPlan() {
    print("create a workout plan");
  }

  @override
  void updatePlan() {
    print("Update your workout plan");
  }
}
