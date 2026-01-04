import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/task_provider.dart';
import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../design_system/spacing.dart';

import '../tasks/task_list_page.dart';
import '../tasks/task_add_page.dart';
import '../tasks/task_detail_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final total = provider.tasks.length;
    final selesai = provider.tasks.where((e) => e.isDone).length;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ✅ APPBAR DENGAN DAFTAR TUGAS
      appBar: AppBar(
        title: const Text('Tugas Besar'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TaskListPage(),
                ),
              );
            },
            child: const Text(
              'Daftar Tugas',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 STATISTIK
            Row(
              children: [
                _infoCard('Total Tugas', total.toString()),
                const SizedBox(width: AppSpacing.s16),
                _infoCard('Selesai', selesai.toString()),
              ],
            ),

            const SizedBox(height: AppSpacing.s24),

            // 🔹 JUDUL LIST
            Text('Tugas Terdekat', style: AppText.section),
            const SizedBox(height: AppSpacing.s8),

            // 🔹 LIST TUGAS
            Expanded(
              child: provider.tasks.isEmpty
                  ? const Center(
                      child: Text('Belum ada tugas'),
                    )
                  : ListView.separated(
                      itemCount: provider.tasks.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppSpacing.s8),
                      itemBuilder: (context, index) {
                        final t = provider.tasks[index];

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              t.title,
                              style: AppText.body.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              t.course,
                              style: AppText.caption,
                            ),
                            trailing: Chip(
                              label: Text(t.status),
                              backgroundColor: t.isDone
                                  ? Colors.green.shade100
                                  : Colors.blue.shade100,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      TaskDetailPage(task: t),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // ✅ FAB TAMBAH TUGAS
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Tugas'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TaskAddPage(),
            ),
          );
        },
      ),
    );
  }

  // 🔹 CARD STATISTIK
  Widget _infoCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.caption),
            const SizedBox(height: 8),
            Text(value, style: AppText.title),
          ],
        ),
      ),
    );
  }
}
