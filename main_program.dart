import 'dart:io';
import 'user.dart';

void main() {
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

    User user = User();

    print("Set a Username : ");
    String? username_signup = stdin.readLineSync();

    print("Set a Password : ");
    String? password_signup = stdin.readLineSync();

    print("Enter your age : ");
    int? age_signup = stdin.readByteSync();

    user.username = username_signup;
    user.password = password_signup;
    user.age = age_signup;

    user.Signup();
  } else if (user_menu_input == "2") {
    print("Login to Account Selected");

    User user = User();

    print("Enter Username : ");
    String? username_login = stdin.readLineSync();

    print("Enter Password : ");
    String? password_login = stdin.readLineSync();

    user.username = username_login;
    user.password = password_login;

    user.Login();
  } else {
    print("Wrong Input");
  }
}





//for the data store use files and manipulate the files use file handling in dart

//need to apply data structures and sorting algorithms and searching alogrithms to the project



