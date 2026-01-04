class Task {
  final int? id;
  final String title;
  final String course;
  final String deadline;
  final String status;
  final String note;
  final bool isDone;

  Task({
    this.id,
    required this.title,
    required this.course,
    required this.deadline,
    required this.status,
    required this.note,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    course: json['course'],
    deadline: json['deadline'],
    status: json['status'],
    note: json['note'] ?? '',
    isDone: json['is_done'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'course': course,
    'deadline': deadline,
    'status': status,
    'note': note,
    'is_done': isDone,
  };
}
