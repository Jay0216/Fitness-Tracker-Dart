class User {
  String? username;
  String? password;
  int? age;

  void Login() {
    print("Login Feature for User");

    //if username == input_username && password == input_password
    //void userMenu()
    //keep repeating the user login form using while loop

    _userMenu();
  }

  void Signup() {
    print("Signup Feature for users");
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
