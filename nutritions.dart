import 'manage_plans.dart';

class Nutritions implements ManagePlans {
  late String nutrition_name;
  late String food_name;
  String? duration;

  @override
  void setPlan() {
    print("Create your nutrition plan");
  }

  @override
  void updatePlan() {
    print("Update your nutrition Plan");
  }

  void nutritionsPlan() {
    print("This is Your Nutrition List");
  }
}
