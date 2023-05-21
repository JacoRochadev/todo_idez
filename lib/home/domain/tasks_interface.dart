import '../../app/domain/entities/task.dart';

abstract class TasksInterface {
  Map<String, Task> tasks = {};
  Future<void> getTasks();
  Future<void> saveTask(Task task);
  Future<void> deleteTask(String key);
}
