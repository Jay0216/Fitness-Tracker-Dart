class ManagePlans {
  void viewPlans(String? data_id) {
    print("This is Plans View Method");
  }
}

abstract class ManageUserInteractions {
  Future<String?> Login();

  void Signup();

  void createNutritionPlans(
      var username, var food_name, var nutrition, var duration);

  void updateNutritionPlan(String? user_n, var food_name, var nutrition,
      var duration, var update_line);

  void updateWorkoutPlan(String? user_id, var w_name, var body_part, var set,
      var rep, var update_line);
}


// in this abstract class uses for implement both polymorphism and abstraction


// in the first abstract class is used for polymorphism 


// the second abstract class is use for abstraction without provide any implementations (hiding the complexity of the logic)


