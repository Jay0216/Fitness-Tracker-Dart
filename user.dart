import "dart:io";
import "dart:math";
import "dart:convert";

class User {
  String? username;
  String? password;
  int? age;

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

    if (file_username == username && file_password == password) {
      print("Login success");

      _userMenu();
    } else {
      print("Login Failed");
    }

    //if (username == username_login && password == password_login) {
    //print("Login Success");

    //_userMenu();
    //} else {
    //print("Login Failed");
    //}
  }

  void Signup() async {
    print("Signup Feature for users");

    final file_create_path =
        'N:/Dart Projects/Fiteness Tracker/Fitness-Tracker-Dart/Database/${username}.txt';

    File(file_create_path).create(recursive: true);

    //write in a file the user data

    String data = '${username} ${password} ${age}';

    var file = await File(file_create_path).writeAsString(data);
  }

  // ignore: unused_element
  void _userMenu() {
    print("");
    print("User Menu Portal");

    var user_menu = [
      "1. Create a Workout Plan",
      "2. Set Fitness Goals",
      "3. Add a Nutrition List"
    ];

    for (var menu in user_menu) {
      print(menu);
    }
  }
}
