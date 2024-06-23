import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/my_button.dart';

class DialogBox extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text("ADD TASK"),
      ),
      backgroundColor: Colors.yellow[300],
      content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Task Name"),
              ),
              //TODO -add two buttons here!
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //save button
                  MyButton(text: "Save", onPressed: widget.onSave),

                  //cancel button
                  MyButton(text: "Cancel", onPressed: widget.onCancel),
                ],
              )
            ],
          )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );
  }
}
