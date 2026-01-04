import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task_model.dart';
import '../../state/task_provider.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;
  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    final noteCtrl = TextEditingController(text: task.note);

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(task.course),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: task.isDone,
              title: const Text('Tugas sudah selesai'),
              onChanged: (_) => provider.toggleDone(task),
            ),
            TextField(
              controller: noteCtrl,
              decoration: const InputDecoration(labelText: 'Catatan'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                provider.toggleDone(task);
                Navigator.pop(context);
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
