import 'dart:convert';
import 'dart:io';
import 'abstract_classes.dart';

class Nutritions extends ManagePlans {
  late String nutrition_name;
  late String food_name;
  String? duration;

  @override
  void viewPlans(String? data_id) async {
    // use map data structure when getting the data from file and added map data structure keys
    print("Viewing Nutrition Plans");

    final n_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${data_id}.txt');

    Stream<String> read_data = n_file_path.openRead().transform(utf8.decoder);
  }
}
