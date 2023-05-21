import '../../app/domain/entities/task.dart';

abstract class TasksInterface {
  Future<void> initializePersistenceModule();
  Future<List<Task>> getTasks();
  Future<Task> saveTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task oldTask, Task newTask);
}
