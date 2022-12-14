import 'package:flutter/material.dart';
import 'package:todo_list/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  // DIALOGBOX CONTROLLER
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[50],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // inputText
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Task Name"),
            ),
            // button -> save    and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: "CANCEL", color: Colors.red, onPressed: onCancel),
                Buttons(text: "SAVE", color: Colors.blue, onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
