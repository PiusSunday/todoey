import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskManager extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Go to Gym'),
    Task(name: 'Call Mom'),
    Task(name: 'Study my Books!'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  // This method is called when the user taps the 'Add' button in the modal bottom sheet.
  // It adds the new task to the list of tasks.
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  // This method is called when a task is checked or unchecked.
  // It updates the 'done' status of the task at the given index in the list of tasks.
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // This method is called when the user taps the 'Delete' button in the modal bottom sheet.
  // It removes the task at the given index from the list of tasks.
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // This method is called when the user taps the 'Delete All' button in the modal bottom sheet.
  // It removes all tasks from the list of tasks.
  void deleteAllTasks() {
    _tasks.clear();
    notifyListeners();
  }

  void deleteAllTasksDone() {
    _tasks.removeWhere((task) => task.isDone);
    notifyListeners();
  }

  void deleteAllTasksNotDone() {
    _tasks.removeWhere((task) => !task.isDone);
    notifyListeners();
  }

  // int get taskCountDone {
  //   return tasks.where((task) => task.isDone).length;
  // }

  // int get taskCountNotDone {
  //   return tasks.where((task) => !task.isDone).length;
  // }

  // List<Task> get tasksDone {
  //   return tasks.where((task) => task.isDone).toList();
  // }

  // List<Task> get tasksNotDone {
  //   return tasks.where((task) => !task.isDone).toList();
  // }
}
