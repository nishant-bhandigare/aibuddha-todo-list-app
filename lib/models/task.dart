enum TaskStatus {pending, inProgress, completed}

class Task {
  String taskName;
  String taskDescription;
  DateTime dateTime;
  DateTime endDateTime;
  TaskStatus status;

  Task({
    required this.taskName,
    required this.taskDescription,
    required this.dateTime,
    required this.endDateTime,
    required this.status,
  });
}