import 'package:flutter/material.dart';
import 'package:flutter_labs/initial/entities/lab.dart';
import 'package:flutter_labs/initial/entities/task.dart';
import 'package:flutter_labs/initial/screens/task_details_screen.dart';
import 'package:flutter_labs/labs/lab1/task1/screens/fuel_calculator_screen.dart';
import 'package:flutter_labs/labs/lab1/task2/screens/fuel_oil_calculator_screen.dart';

class TaskListScreen extends StatelessWidget {
  final Lab lab;

  const TaskListScreen({super.key, required this.lab});

  List<Task> getTasksForLab(int labId) {
    switch (labId) {
      case 1:
        return [
          const Task("1", "Fuel Calculator", FuelCalculatorScreen()),
          const Task("2", "Fuel Oil Calculator", FuelOilCalculatorScreen())
        ];
      case 2:
        return [Task("1", "Task 1", Container())];
      case 3:
        return [Task("1", "Task 1", Container())];
      case 4:
        return [Task("1", "Task 1", Container())];
      case 5:
        return [Task("1", "Task 1", Container())];
      case 6:
        return [Task("1", "Task 1", Container())];
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
                      builder: (context) => TaskDetailsScreen(
                        task: task,
                        labId: lab.id,
                        taskScreen: task.screen,
                        taskTitle: task.name,
                      ),
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