import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/provider/task_manager.dart';

class TaskDismissible extends StatelessWidget {
  const TaskDismissible({
    Key? key,
    required this.taskManager,
    required this.task,
    required this.index,
  }) : super(key: key);

  final TaskManager taskManager;
  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),

      // Dismissible properties
      background: Container(
        color: Colors.red,
      ),

      onDismissed: (direction) {
        taskManager.deleteTask(task);
      },

      // Confirm Dismiss
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 25.0,
              ),
            ),
            content: const Text(
              "Are you sure you want to delete this task?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },

      // Secondary Dismiss
      secondaryBackground: Container(
        color: Colors.teal,
        child: const Icon(Icons.edit),
      ),

      direction: DismissDirection.horizontal,

      // Dismiss Threshold
      dismissThresholds: const {
        DismissDirection.endToStart: 0.5,
        DismissDirection.startToEnd: 0.5,
      },

      // Resize Dismissible
      resizeDuration: const Duration(milliseconds: 300),

      // Drag Start Behavior
      dragStartBehavior: DragStartBehavior.start,

      // Drag Start Behavior
      movementDuration: const Duration(milliseconds: 300),

      // Drag Start Behavior
      crossAxisEndOffset: 0.5,

      // Dismissible Child
      child: TaskTile(
        taskTitle: task.name,
        isChecked: task.isDone,
        checkboxCallback: (bool? checkboxState) {
          taskManager.updateTask(task);
        },
      ),
    );
  }
}
