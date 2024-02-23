import 'dart:io';
import 'user.dart';

void main() {
  welcomeNote();

  appMenu();
}

void welcomeNote() {
  print("");

  print("------------- Fitness Academy Build Your Dream ----------------");

  print("");
  print("");

  print("-- Let's Get Started --");
}

void appMenu() {
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

    User user = User();
    user.Signup();
  } else if (user_menu_input == "2") {
    print("Login to Account Selected");

    User user = User();
    user.Login();
  } else {
    print("Wrong Input");
  }
}


//for the data store use files and manipulate the files use file handling in dart



