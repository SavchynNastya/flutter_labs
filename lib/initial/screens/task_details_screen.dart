import 'package:flutter/material.dart';
import 'package:flutter_labs/initial/entities/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;
  final int labId;

  const TaskDetailsScreen({super.key, required this.task, required this.labId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Details")),
      body: Center(
        child: Text("Details for Task ${task.name} in Lab $labId"),
      ),
    );
  }
}