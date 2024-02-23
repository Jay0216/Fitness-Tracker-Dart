import 'manage_plans.dart';

class Nutritions implements ManagePlans {
  late String nutrition_name;
  late String food_name;
  String? duration;

  @override
  void createPlan() {
    print("Create your nutrition plan");
  }

  @override
  void updatePlan() {
    print("Update your nutrition Plan");
  }
}
