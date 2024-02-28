import "dart:io";
import "dart:math";
import "dart:convert";

import 'navigations.dart';
import 'nutritions.dart';
import 'workout_plans.dart';

class GymUser {
  String? name;
  String? age;

  String? username;
  String? _password;

  void setPassword(String? password) {
    _password = password;
  }

  void Login() async {
    print("Login Feature for User");

    //String? username_login = stdin.readLineSync();
    //String? password_login = stdin.readLineSync();

    final file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt');

    Stream<String> read_lines = file_path.openRead().transform(utf8.decoder);

    var read_data;
    try {
      await for (var lines in read_lines) {
        //print(lines);

        read_data = lines;
      }
    } catch (e) {
      print(e);
    }

    String data_lines = read_data.toString();

    var data_array = [];

    data_array = data_lines.split(" ");

    String file_username = data_array[0];
    String file_password = data_array[1];

    if (file_username == username && file_password == _password) {
      print("Login Success");
      Navigations navigations = Navigations();

      navigations.userDashboardUI();
    } else if (file_username != username && file_password != _password) {
      print("Login Failed");

      Navigations navigations = Navigations();

      navigations.LoginUI();
    }
  }

  void Signup() async {
    print("Signup Feature for users");

    final file_create_path =
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt';

    File(file_create_path).create(recursive: true);

    //write in a file the user data

    String data = '${username} ${_password} ${age}';

    var file = await File(file_create_path).writeAsString(data);
  }

  void createNutritionPlans() {
    Nutritions nutritions = Nutritions();

    nutritions.setPlan();
  }

  void createWorkoutPlans() {
    Workouts workouts = Workouts();

    workouts.setPlan();
  }

  void updateNutritionPlan() {
    Nutritions nutritions = Nutritions();

    nutritions.updatePlan();
  }

  void updateWorkoutPlan() {
    Workouts workouts = Workouts();

    workouts.updatePlan();
  }
}
