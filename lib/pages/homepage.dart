import 'package:flutter/material.dart';
import 'package:todo_list/util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// textController

  final _controller = TextEditingController();

// list of todoList
  List todoList = [
    ["Practice Flutter", false],
    ["Practice Dart", false],
    ["Practice PowerBI", false],
  ];

// changeBoxChange
  void changeboxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

// SAVE TASK
  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  // CreateList
  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  // DELETETASK
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("HAIN")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: todoList[index][0],
                taskCompletion: todoList[index][1],
                onChanged: (value) => changeboxChange(value, index),
                deleteFunction: (context) => deleteTask(index));
          }),
    );
  }
}
