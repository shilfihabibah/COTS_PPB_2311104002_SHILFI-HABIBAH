import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/config/api_config.dart';
import '../models/task_model.dart';

class TaskService {
  static Future<List<Task>> getTasks({String? status}) async {
    final url = status == null
        ? '${ApiConfig.baseUrl}/rest/v1/tasks?select=*'
        : '${ApiConfig.baseUrl}/rest/v1/tasks?select=*&status=eq.$status';

    final res = await http.get(Uri.parse(url), headers: ApiConfig.headers);
    final List data = jsonDecode(res.body);
    return data.map((e) => Task.fromJson(e)).toList();
  }

  static Future<void> addTask(Task task) async {
    await http.post(
      Uri.parse('${ApiConfig.baseUrl}/rest/v1/tasks'),
      headers: {...ApiConfig.headers, 'Prefer': 'return=representation'},
      body: jsonEncode(task.toJson()),
    );
  }

  static Future<void> updateTask(int id, Map<String, dynamic> body) async {
    await http.patch(
      Uri.parse('${ApiConfig.baseUrl}/rest/v1/tasks?id=eq.$id'),
      headers: {...ApiConfig.headers, 'Prefer': 'return=representation'},
      body: jsonEncode(body),
    );
  }
}
