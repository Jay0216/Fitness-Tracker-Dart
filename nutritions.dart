import 'dart:convert';
import 'dart:io';
import 'abstract_classes.dart';

class Nutritions extends ManagePlans {
  late String nutrition_name;
  late String food_name;
  late String duration;

  @override
  void viewPlans(String? data_id) async {
    // use map data structure when getting the data from file and added map data structure keys
    print("Viewing Nutrition Plans");

    final n_file_path = File(
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${data_id}.txt');

    Stream<String> read_data_ar = n_file_path
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());

    var n_data;

    List<String> nutritions_data_array = [];

    try {
      await for (var nutrition_data in read_data_ar) {
        n_data = nutrition_data;

        nutritions_data_array.add(nutrition_data);
      }
    } catch (e) {
      print(e);
    }

    String data_lines = n_data.toString();

    // you need to add sorting algorithm to sort nutritions based on added time

    nutritions_data_array.forEach((data) {
      print(data);
    });

    //data_array.insert(1, "Hello test");

    /// need to transform to orginal data format and order of the File
    ///

    //data_array.insert(1, "Hello test");

    //data_array.removeWhere((array_element) => array_element.isEmpty);

    //data_array.add("");

    //var file_content_test = data_array.join('\n');

    //var file_data_test = await n_file_path.writeAsString(file_content_test,
    //mode: FileMode.append);

    //print(data_array);
  }
}
