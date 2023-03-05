import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task_manager.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  runApp(const Todoey());
}

class Todoey extends StatelessWidget {
  const Todoey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskManager>(
      create: (context) => TaskManager(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todoey App",
    
        home: TasksScreen(),
      ),
    );
  }
}
