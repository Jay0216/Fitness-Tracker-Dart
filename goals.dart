class Goals {
  String? goal_name;
  int? durations;
  bool? achievement_status;

  Goals({this.goal_name, this.achievement_status, this.durations});

  void viewGoals() {
    print("Your Goals List");
  }
}
