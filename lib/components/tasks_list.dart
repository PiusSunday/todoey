import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_dismissible.dart';
import 'package:todoey/provider/task_manager.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(
      builder: (context, taskManagerData, child) {
        return ListView.builder(
          itemCount: taskManagerData.taskCount,
          itemBuilder: (context, index) {
            final task = taskManagerData.tasks[index];
            return TaskDismissible(
              taskManager: taskManagerData,
              task: task,
              index: index,
            );
          },
        );
      },
    );
  }
}
