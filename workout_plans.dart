import 'dart:convert';
import 'dart:io';

import 'abstract_classes.dart';

class Workouts extends ManagePlans {
  String? w_name;
  String? body_part;
  String? sets;
  String? reps;

  @override
  void viewPlans(String? data_id) async {
    print("Viewing Your Workouts Plans");

    print('');
    print('');

    final data_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${data_id}.txt');

    Stream<String> read_data = data_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    List<String> all_data = [];

    await for (final all_file_data in read_data) {
      all_data.add(all_file_data);
    }

    // find the last index of all data array

    var maximum_range = all_data.length;

    //print(maximum_range);

    var workout_data = all_data.getRange(13, maximum_range);

    List<String> workout_data_array = workout_data.toList();

    //print(workout_data_array);

    // bug fixed in view workout plans feature

    //workout_data_array.forEach((w_data) {
    //print(w_data);
    //})

    for (var workout_data in workout_data_array) {
      print(workout_data);
    }
  }
}
