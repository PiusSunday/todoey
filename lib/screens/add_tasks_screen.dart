import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task_manager.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 20.0,
          ),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                  textAlign: TextAlign.center,
                  autofocus: true,
                  cursorColor: Colors.lightBlueAccent,
                  cursorWidth: 3.0,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  if (newTaskTitle != null) {
                    Provider.of<TaskManager>(
                      context,
                      listen: false,
                    ).addTask(newTaskTitle!);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
