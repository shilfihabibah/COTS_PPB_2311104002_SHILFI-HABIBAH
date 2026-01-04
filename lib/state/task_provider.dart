import 'package:flutter/material.dart';
import '../data/models/task_model.dart';
import '../data/services/task_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> fetchTasks() async {
    tasks = await TaskService.getTasks();
    notifyListeners();
  }

  Future<void> add(Task task) async {
    await TaskService.addTask(task);
    await fetchTasks();
  }

  Future<void> toggleDone(Task task) async {
    await TaskService.updateTask(task.id!, {
      'is_done': !task.isDone,
      'status': task.isDone ? 'BERJALAN' : 'SELESAI',
    });
    await fetchTasks();
  }
}
