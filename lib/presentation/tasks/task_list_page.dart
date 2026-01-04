import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/task_provider.dart';
import 'task_detail_page.dart';
import 'task_add_page.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Tugas')),
      body: ListView.builder(
        itemCount: provider.tasks.length,
        itemBuilder: (c, i) {
          final t = provider.tasks[i];
          return ListTile(
            title: Text(t.title),
            subtitle: Text(t.course),
            trailing: Text(t.deadline),
            onTap: () => Navigator.push(
              c,
              MaterialPageRoute(builder: (_) => TaskDetailPage(task: t)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TaskAddPage()),
        ),
      ),
    );
  }
}
