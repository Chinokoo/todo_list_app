import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/data/database.dart';
import 'package:todo_list_app/utils/dialog_box.dart';
import 'package:todo_list_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box.
  final _box = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //when the check box is checked or unchecked
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //text controller.
  final _controller = TextEditingController();

  // cancelTask - when the cancel button is pressed
  void cancelTask() {
    Navigator.of(context).pop();
  }

  //saveTask - when the save button is pressed
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //when the add button is pressed
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: cancelTask,
          );
        });
  }

  //delete task
  void deletetask(int index) {
    setState(() {
      db.toDoList.remove(db.toDoList[0]);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text("ToDo")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        elevation: 1,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskCompleted: db.toDoList[index][1],
              taskName: db.toDoList[index][0],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteTask: (context) => deletetask(index),
            );
          }),
    );
  }
}
