import 'abstract_classes.dart';

class Nutritions extends ManagePlans {
  late String nutrition_name;
  late String food_name;
  String? duration;

  @override
  void viewPlans(String? data_id) {
    print("Viewing Nutrition Plans");
  }
}
