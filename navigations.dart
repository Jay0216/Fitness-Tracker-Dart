import 'dart:io';
import 'nutritions.dart';
import 'user.dart';

class Navigations {
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
  }

  void NutrionUI() {
    print("Your Nutritions is Here");

    //Nutrition Feature Access Menu()

    Nutritions nutritions = Nutritions();

    nutritions.nutritionsPlan();
  }
}
