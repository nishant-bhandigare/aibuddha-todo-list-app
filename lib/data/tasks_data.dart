import '../models/task.dart';

List<Task> pendingTasks = [
  Task(
    taskName: "Task 1",
    taskDescription: "Description for Task 1",
    dateTime: DateTime.now(),
    endDateTime: DateTime.now().add(const Duration(days: 1)),
    status: TaskStatus.pending,
  ),
  Task(
    taskName: "Task 2",
    taskDescription: "Description for Task 2",
    dateTime: DateTime.now().add(const Duration(hours: 2)),
    endDateTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
    status: TaskStatus.inProgress,
  ),
];

List<Task> inProgressTasks = [
  Task(
    taskName: "Task 1",
    taskDescription: "Description for Task 1",
    dateTime: DateTime.now(),
    endDateTime: DateTime.now().add(const Duration(days: 1)),
    status: TaskStatus.pending,
  ),
  Task(
    taskName: "Task 2",
    taskDescription: "Description for Task 2",
    dateTime: DateTime.now().add(const Duration(hours: 2)),
    endDateTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
    status: TaskStatus.inProgress,
  ),
];

List<Task> completedTasks = [
  Task(
    taskName: "Task 1",
    taskDescription: "Description for Task 1",
    dateTime: DateTime.now(),
    endDateTime: DateTime.now().add(const Duration(days: 1)),
    status: TaskStatus.pending,
  ),
  Task(
    taskName: "Task 2",
    taskDescription: "Description for Task 2",
    dateTime: DateTime.now().add(const Duration(hours: 2)),
    endDateTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
    status: TaskStatus.inProgress,
  ),
];