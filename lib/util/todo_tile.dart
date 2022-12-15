import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompletion;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompletion,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompletion,
                onChanged: onChanged,
                activeColor: Colors.blueGrey[100],
                checkColor: Colors.black,
                side: const BorderSide(color: Colors.blueGrey, width: 16),
              ),
              const SizedBox(width: 5),
              Center(
                child: Text(
                  taskName,
                  style: TextStyle(
                      color: taskCompletion ? Colors.red[200] : Colors.white,
                      fontSize: taskCompletion ? 12 : 18,
                      decoration:
                          taskCompletion ? TextDecoration.lineThrough : null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
