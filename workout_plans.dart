import 'abstract_classes.dart';

class Workouts extends ManagePlans {
  String? w_name;
  String? body_part;
  String? sets;
  String? reps;

  @override
  void viewPlans(String? data_id) {
    print("View Workouts Plans");
  }
}
