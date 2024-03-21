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
    print("View Workouts Plans");

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

    var workout_data = all_data.getRange(13, 16);

    List<String> workout_data_array = workout_data.toList();

    workout_data_array.forEach((w_data) {
      print(w_data);
    });
  }
}
