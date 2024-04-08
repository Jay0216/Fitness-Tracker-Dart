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

  Future<void> LoginUI() async {
    print("Login UI");

    GymUser user = GymUser();

    print("Enter your username : ");
    String? login_username = stdin.readLineSync();

    print("Enter your password : ");
    String? login_password = stdin.readLineSync();

    user.username = login_username!;

    user.setPassword(login_password);

    var file_creds = await user.Login();

    print(file_creds.toString());

    String input_creds = '${login_username} ${login_password}';

    if (input_creds == file_creds.toString()) {
      print('Login Success');

      userDashboardUI(user.username);
    } else {
      print('Login Failed');

      LoginUI();
    }
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
    user.username = signup_username!;
    user.age = age;

    user.setPassword(signup_password);

    user.Signup();
  }

  void userDashboardUI(String? username) {
    print("");

    print('Hello ${username}');
    print("User Menu Portal");

    var user_menu = [
      "1. Create a Workout Plan",
      "2. Add a Nutrition List",
      "3. View your Nutritions",
      "4. Your Current Workout Plan",
      "5. Update Your Nutritions",
      "6. Update Your Workout Plan"
    ];

    for (var menu in user_menu) {
      print(menu);
    }

    print("");
    print("Select menu number : ");
    String? gym_user_choice = stdin.readLineSync();

    if (gym_user_choice == "1") {
      addWorkoutUI(username);
    } else if (gym_user_choice == "2") {
      addNutritionUI(username);
    } else if (gym_user_choice == '3') {
      viewNutritionsUI(username);
    } else if (gym_user_choice == '4') {
      viewWorkoutUI(username);
    } else if (gym_user_choice == '5') {
      updateNutritionsUI(username);
    } else if (gym_user_choice == '6') {
      updateWorkoutUI(username);
    }
  }

  void addNutritionUI(String? username) async {
    print("Add Your Nutritions");

    print("");

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
    //print("Verify your username : ");
    //var user_id = stdin.readLineSync();

    user.createNutritionPlans(username, food_name, nutrition_name, duration);
    //else if (nutrition_plan_manage == "3") {
    //GymUser user = GymUser();

    //user.getNutritionsList();
    //}

    //Nutrition Feature Access Menu()
  }

  void updateNutritionsUI(String? user_n) {
    print("Update Your Nutritions");

    print("");

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
    //print("Verify your username : ");
    //var user_id = stdin.readLineSync();

    user.updateNutritionPlan(user_n);
  }

  void addWorkoutUI(String? user_id) {
    print("Add your Workout plan");

    print("");

    GymUser user = GymUser();

    print("");
    print("Enter Workout Plan Name : ");
    var w_name = stdin.readLineSync();

    print("");
    print("Enter Body Part Name : ");
    var body_part = stdin.readLineSync();

    print("");
    print("Enter Sets of Plan : ");
    var sets = stdin.readLineSync();

    print("");
    print("Enter Reps of Plan : ");
    var reps = stdin.readLineSync();

    user.createWorkoutPlans(user_id, w_name, body_part, sets, reps);
  }

  void updateWorkoutUI(String? user_n) {
    print('update your workout plan');

    GymUser user = GymUser();

    print("");

    print("");
    print("Select Update Line : ");
    String? update_line_string = stdin.readLineSync();
    int update_line = int.parse(update_line_string!);

    print("Enter Workout Plan Name : ");
    var w_name = stdin.readLineSync();

    print("");
    print("Enter Body Part Name : ");
    var body_part = stdin.readLineSync();

    print("");
    print("Enter Sets of Plan : ");
    var sets = stdin.readLineSync();

    print("");
    print("Enter Reps of Plan : ");
    var reps = stdin.readLineSync();

    user.updateWorkoutPlan(user_n, w_name, body_part, sets, reps, update_line);
  }

  void viewNutritionsUI(String? user_n) {
    GymUser user = GymUser();

    user.getNutritionsList(user_n);
  }

  void viewWorkoutUI(String? user_id) {
    GymUser user = GymUser();

    user.getWorkoutList(user_id);
  }
}


// you need to first show the already added workout data then add input fields