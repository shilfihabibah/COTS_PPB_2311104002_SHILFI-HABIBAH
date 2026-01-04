import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task_model.dart';
import '../../state/task_provider.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({super.key});

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  final titleCtrl = TextEditingController();
  final courseCtrl = TextEditingController();
  final deadlineCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Judul Tugas'),
            ),
            TextField(
              controller: courseCtrl,
              decoration: const InputDecoration(labelText: 'Mata Kuliah'),
            ),
            TextField(
              controller: deadlineCtrl,
              decoration: const InputDecoration(
                labelText: 'Deadline (YYYY-MM-DD)',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final task = Task(
                  title: titleCtrl.text,
                  course: courseCtrl.text,
                  deadline: deadlineCtrl.text,
                  status: 'BERJALAN',
                  note: '',
                  isDone: false,
                );
                await Provider.of<TaskProvider>(
                  context,
                  listen: false,
                ).add(task);
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
