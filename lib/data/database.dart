import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];

  // reference the box
  final _box = Hive.box('mybox');

  //run this method if it is the first time opening the app.
  void createInitialData() {
    toDoList = [
      ["wake up at 5:00 AM", false],
      ["Brush your teeth", false],
    ];
  }

  //loading data from the database.
  void loadData() {
    toDoList = _box.get("TODOLIST");
  }

  //updating the database.
  void updateDatabase() {
    _box.put("TODOLIST", toDoList);
  }
}
