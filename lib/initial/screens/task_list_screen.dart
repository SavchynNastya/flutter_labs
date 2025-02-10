import 'package:flutter/material.dart';
import 'package:flutter_labs/initial/entities/lab.dart';
import 'package:flutter_labs/initial/entities/task.dart';
import 'package:flutter_labs/initial/screens/task_details_screen.dart';

class TaskListScreen extends StatelessWidget {
  final Lab lab;
  const TaskListScreen({super.key, required this.lab});

  List<Task> getTasksForLab(int labId) {
    switch (labId) {
      case 1:
        return const [Task("1", "Task 1"), Task("2", "Task 2")];
      case 2:
        return const [Task("1", "Task 1")];
      case 3:
        return const [Task("1", "Task 1")];
      case 4:
        return const [Task("1", "Task 1")];
      case 5:
        return const [Task("1", "Task 1")];
      case 6:
        return const [Task("1", "Task 1")];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = getTasksForLab(lab.id);

    return Scaffold(
      appBar: AppBar(title: Text("Tasks for ${lab.name}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: tasks.map((task) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailsScreen(task: task, labId: lab.id),
                    ),
                  );
                },
                child: Text(task.name),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}