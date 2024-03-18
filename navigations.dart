import 'dart:io';
import 'nutritions.dart';
import 'user.dart';
import 'workout_plans.dart';

class Navigations {
  void mainUI() {
    welcomeNote();

    appmainMenu();
  }

  void welcomeNote() {
    print("");

    print("------------- Fitness Academy Build Your Dream ----------------");

    print("");
    print("");

    print("-- Let's Get Started --");
  }

  void appmainMenu() {
    print("");

    int menu_counter = 0;

    var menu = ["1. Create a Account", "2. Login to Account"];

    while (menu_counter <= 1) {
      print(menu[menu_counter]);

      menu_counter++;
    }
    print("");

    print("Select Menu : ");

    String? user_menu_input = stdin.readLineSync();

    if (user_menu_input == "1") {
      print("Create a Account Selected");

      print("");

      Navigations navigations = Navigations();

      navigations.SignupUI();
    } else if (user_menu_input == "2") {
      print("Login to Account Selected");

      Navigations navigations = Navigations();

      navigations.LoginUI();
    } else {
      print("Wrong Input");
    }
  }

  void LoginUI() {
    print("Login UI");

    GymUser user = GymUser();

    print("Enter your username : ");
    String? login_username = stdin.readLineSync();

    print("Enter your password : ");
    String? login_password = stdin.readLineSync();

    user.username = login_username;

    user.setPassword(login_password);

    user.Login();
  }

  void SignupUI() {
    print("Signup UI");

    GymUser user = GymUser();

    print("Enter a username for account : ");
    String? signup_username = stdin.readLineSync();

    print("Enter a password : ");
    String? signup_password = stdin.readLineSync();

    print("Enter your name : ");
    String? name = stdin.readLineSync();

    print("Enter your age : ");
    String? age = stdin.readLineSync();

    user.name = name;
    user.username = signup_username;
    user.age = age;

    user.setPassword(signup_password);

    user.Signup();
  }

  void userDashboardUI() {
    print("");
    print("User Menu Portal");

    var user_menu = [
      "1. Create a Workout Plan",
      "2. Set Fitness Goals",
      "3. Add a Nutrition List",
      "4. View your Goals",
      "5. View your Nutritions",
      "6. Your Current Workout Plan"
    ];

    for (var menu in user_menu) {
      print(menu);
    }

    print("");
    print("Select menu number : ");
    String? gym_user_choice = stdin.readLineSync();

    if (gym_user_choice == "1") {
      WorkoutUI();
    } else if (gym_user_choice == "3") {
      NutritionUI();
    } else if (gym_user_choice == "2") {
      GoalsUI();
    }
  }

  void NutritionUI() async {
    print("Your Nutritions is Here");

    var nutrition_menu = [
      "1. Add New Nutritions.",
      "2. Update Nutritions List",
      "3. View Nutrition Existing Plans"
    ];

    for (var n_menu in nutrition_menu) {
      print(n_menu);
    }

    print("");

    print("What do you want to do : ");
    String? nutrition_plan_manage = stdin.readLineSync();

    if (nutrition_plan_manage == "3") {
      print("");
      print("Enter Your Database ID : ");
      var database_id = stdin.readLineSync();

      GymUser user = GymUser();

      user.username = database_id;

      user.getNutritionsList();
    } else if (nutrition_plan_manage == "1") {
      GymUser user = GymUser();

      print("");
      print("Enter Food Name : ");
      var food_name = stdin.readLineSync();

      print("");
      print("Enter Nutrition Name : ");
      var nutrition_name = stdin.readLineSync();

      print("");
      print("Enter Duration of the Plan : ");
      var duration = stdin.readLineSync();

      print("");
      print("Verify your username : ");
      var user_id = stdin.readLineSync();

      user.createNutritionPlans(user_id, food_name, nutrition_name, duration);
    } else if (nutrition_plan_manage == "2") {
      GymUser user = GymUser();

      user.updateNutritionPlan();
    } else if (nutrition_plan_manage == "3") {
      GymUser user = GymUser();

      user.getNutritionsList();
    }

    //Nutrition Feature Access Menu()
  }

  void WorkoutUI() {
    print("This is your Workout plan");

    GymUser user = GymUser();

    user.getWorkoutList();
  }

  void GoalsUI() {
    print("This is Your Goals List");
  }
}
