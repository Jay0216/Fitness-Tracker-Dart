class ManagePlans {
  void viewPlans(String? data_id) {
    print("This is Plans View Method");
  }
}

abstract class ManageUserInteractions {
  void Login();

  void Signup();

  void createNutritionPlans();

  void updateNutritionPlan();

  void updateWorkoutPlan();
}


// in this abstract class uses for implement both polymorphism and abstraction


// in the first abstract class is used for polymorphism 


// the second abstract class is use for abstraction without provide any implementations (hiding the complexity of the logic)


