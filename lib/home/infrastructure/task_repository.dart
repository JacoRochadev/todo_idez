import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_idez/app/domain/entities/task.dart';
import 'package:todo_idez/home/domain/tasks_interface.dart';

class TaskRepository implements TasksInterface {
  List<Task> tasks = [];

  final Future<SharedPreferences> _prefsInstance =
      SharedPreferences.getInstance();

  late final SharedPreferences _prefs;

  @override
  Future<void> initializePersistenceModule() async {
    _prefs = await _prefsInstance;
  }

  @override
  Future<Task> saveTask(Task task) async {
    final List<String> listTask = _prefs.getStringList('tasks') ?? [];
    var id = 1;
    if (listTask.isNotEmpty) {
      final task_ = Task.fromMap(json.decode(listTask.last));
      id = task_.id!;
    }

    final Task task_ = task.copyWith(id: id);
    listTask.add(json.encode(task_.toMap()));

    _prefs.setStringList('tasks', listTask);
    return task_;
  }

  @override
  Future<List<Task>> getTasks() async {
    final List<String> tasks = _prefs.getStringList('tasks') ?? [];
    return tasks.map((e) => Task.fromMap(json.decode(e))).toList();
  }

  @override
  Future<void> deleteTask(Task task) async {
    final List<String> tasks = _prefs.getStringList('tasks') ?? [];
    tasks.remove(jsonEncode(task.toMap()));
    _prefs.setStringList('tasks', tasks);
  }

  @override
  Future<void> updateTask(Task oldTask, Task newTask) async {
    final List<String> tasks = _prefs.getStringList('tasks') ?? [];
    final taskRaw = jsonEncode(oldTask.toMap());
    var index = tasks.indexOf(taskRaw);
    if (index < 0) {
      throw Exception('Objeto não existe');
    }
    tasks[index] = jsonEncode(newTask.toMap());
    _prefs.setStringList('tasks', tasks);
  }
}
