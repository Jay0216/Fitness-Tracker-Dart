// ignore_for_file: unused_field

import 'dart:developer';
import "dart:io";
import "dart:math";
import "dart:convert";
import 'abstract_classes.dart';
import 'navigations.dart';
import 'nutritions.dart';
import 'workout_plans.dart';

class GymUser extends ManageUserInteractions {
  String? name;
  String? age;

  String? username;
  String? _password;

  // use constructor concept for getting username

  // use the login username of the file stored

  void setPassword(String? password) {
    _password = password;
  }

  void Signup() async {
    print("Signup Feature for users");

    final file_create_path =
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt';

    File(file_create_path).create(recursive: true);

    //write in a file the user data

    var file = await File(file_create_path)
        .writeAsString('${username} ${_password} ${age}\n'
            '\n'
            '\n'
            '\n'
            '\n'
            '\n'
            'Nutrition Plans\n'
            '\n'
            '\n'
            'Workout Plans\n'
            '\n'
            '\n');

    //put workout plans data between the last space and workout plans title

    //when a new user signed up arrange the file area like(nutrition plans and for the workout plans)
  }

  Future<String?> Login() async {
    print("Login Feature for User");

    //String? username_login = stdin.readLineSync();
    //String? password_login = stdin.readLineSync();

    final file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt');

    Stream<String> read_lines = file_path.openRead().transform(utf8.decoder);

    var read_data;

    await for (var lines in read_lines) {
      //print(lines);

      read_data = lines;
    }

    var data_array = [];
    try {
      data_array = read_data.split(" ");

      String file_username = data_array[0];
      String file_password = data_array[1];

      String? file_login_creds = '${file_username} ${file_password}';

      return file_login_creds;
    } catch (e) {
      print("Your Database ID was Incorrect");
    }

    //String data_lines = read_data.toString();
  }

  void createNutritionPlans(
      var username, var food_name, var nutrition, var duration) async {
    print("Create a Nutrition Plan");

    final data_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt');

    ;

    Stream<String> readed_file_data = data_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    List<String> all_data = [];

    await for (final file_data in readed_file_data) {
      all_data.add(file_data);
    }

    print(all_data);

    // use a array for this getting file data as a array and update like array

    Nutritions nutritions = Nutritions();

    nutritions.food_name = food_name;
    nutritions.nutrition_name = nutrition;
    nutritions.duration = duration;

    String nutrition_list =
        '${nutritions.food_name} ${nutritions.nutrition_name} ${nutritions.duration}';

    all_data.insert(7, nutrition_list);

    print(all_data);

    var nutritions_data = all_data.join('\n');

    await data_file_path.writeAsString(nutritions_data);

    //file nutrition data arrangement is done

    //print(line_num);

    // find the Nutrition plan area and Workout Plan Area between write the nutritions plan.

    //var file = await data_file_path.writeAsString(
    //'${nutritions.food_name} ${nutritions.nutrition_name} ${nutritions.duration}\n',
    //mode: FileMode.append);
  }

  void createWorkoutPlans(
      var user_id, var workout_name, var body_part, var sets, var reps) async {
    print("Create a Workout Plan");

    final data_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${user_id}.txt');

    ;
    Stream<String> readed_file_data = data_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    List<String> all_data = [];

    await for (final file_data in readed_file_data) {
      all_data.add(file_data);
    }

    Workouts workouts = Workouts();

    workouts.w_name = workout_name;
    workouts.body_part = body_part;
    workouts.sets = sets;
    workouts.reps = reps;

    String workout_plan_list =
        '${workouts.w_name.toString()} ${workouts.body_part.toString()} ${workouts.sets.toString()} ${workouts.reps.toString()}';

    // need to find exact the workout plan array index when nutrition plans are written done
    var workout_plan_index = all_data.indexOf('Workout Plans');

    print(all_data);

    print(workout_plan_index);

    var exact_place = workout_plan_index + 1;

    all_data.insert(exact_place, workout_plan_list);

    var workout_data = all_data.join('\n');

    await data_file_path.writeAsString(workout_data);
  }

  void updateNutritionPlan(String? user_n, var food_name, var nutrition,
      var duration, var update_line) async {
    print("Update Nutrition Plan");

    final data_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${user_n}.txt');

    Stream<String?> readed_content = data_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    List<String?> all_data_arr = [];

    await for (final all_data in readed_content) {
      all_data_arr.add(all_data);
    }

    //var max_ar_length = all_data_arr.length;

    var nutrition_data = all_data_arr.getRange(7, 11);

    List<String?> nutrition_data_ar = nutrition_data.toList();

    var exact_update_line = update_line - 1;

    print("Update Line Selected ${nutrition_data_ar[exact_update_line]}");

    String? selected_line = nutrition_data_ar[exact_update_line];

    var updated_line = nutrition_data_ar.remove(selected_line);

    String up_content = '${food_name} ${nutrition} ${duration}';

    var updated_content =
        nutrition_data_ar.insert(exact_update_line, up_content);

    print(nutrition_data_ar);

    print(all_data_arr);

    //var workout_plan_index = all_data_arr.indexOf('Workout Plans');

    //var exact_index_to_remove = workout_plan_index + 1;

    //List<String?> all_data_range =
    //all_data_arr.getRange(0, exact_index_to_remove).toList();

    //print(all_data_range);

    //List<String?> updated_content_ar = all_data_range + nutrition_data_ar;

    //print(updated_content_ar);

    //var updated_workout_data = updated_content_ar.join('\n');

    //await data_file_path.writeAsString(updated_workout_data);

    print(user_n);
  }

  void updateWorkoutPlan(String? user_id, var w_name, var body_part, var set,
      var rep, var update_line) async {
    print("Update Workout Plan");

    final data_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${user_id}.txt');

    Stream<String?> readed_content = data_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    List<String?> all_data_arr = [];

    await for (final all_data in readed_content) {
      all_data_arr.add(all_data);
    }

    var max_ar_length = all_data_arr.length;

    var workout_data = all_data_arr.getRange(13, max_ar_length);

    List<String?> workout_data_ar = workout_data.toList();

    var exact_update_line = update_line - 1;

    print("Update Line Selected ${workout_data_ar[exact_update_line]}");

    String? selected_line = workout_data_ar[exact_update_line];

    var updated_line = workout_data_ar.remove(selected_line);

    String up_content = '${w_name} ${body_part} ${set} ${rep}';

    var updated_content = workout_data_ar.insert(exact_update_line, up_content);

    print(workout_data_ar);

    print(all_data_arr);

    var workout_plan_index = all_data_arr.indexOf('Workout Plans');

    var exact_index_to_remove = workout_plan_index + 1;

    List<String?> all_data_range =
        all_data_arr.getRange(0, exact_index_to_remove).toList();

    print(all_data_range);

    List<String?> updated_content_ar = all_data_range + workout_data_ar;

    print(updated_content_ar);

    var updated_workout_data = updated_content_ar.join('\n');

    await data_file_path.writeAsString(updated_workout_data);

    // now combine two array together and write it to file

    //var removed_array = all_data_arr.removeRange(start, end)

    //String updated_data = '${w_name} ${body_part} ${set} ${rep}';

    //all_data_arr.removeAt(new_line);

    //all_data_arr.insert(, element)

    //var updated_workout_data = workout_data_ar.join('\n');

    //await data_file_path.writeAsString(updated_workout_data);

    //print("Data Updated Successfully");

    //print(user_id);
  }

  void getNutritionsList(String? user_n) {
    Nutritions nutritions = Nutritions();

    nutritions.viewPlans(user_n);
  }

  void getWorkoutList(String? user_n) {
    Workouts workouts = Workouts();

    workouts.viewPlans(user_n);
  }
}


// find the changing time of the entered username


// and think like the user all of the classes controlling

// think meaningful solutions

// when this user class is calling again calling the class memory will reset i think that is the problem


// need to add only workout data array to file