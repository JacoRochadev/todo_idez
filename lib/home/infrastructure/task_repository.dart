import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_idez/app/domain/entities/task.dart';
import 'package:todo_idez/home/domain/tasks_interface.dart';

class TaskRepository implements TasksInterface {
  @override
  Map<String, Task> tasks = {};

  final Future<SharedPreferences> _prefsInstance =
      SharedPreferences.getInstance();

  late final SharedPreferences _prefs;

  void initializePersistenceModule() async {
    _prefs = await _prefsInstance;
    getTasks();
  }

  @override
  Future<void> saveTask(Task task) async {
    _prefs.setString('tasks', json.encode(task.toMap()));
  }

  @override
  Future<void> getTasks() async {
    if (_prefs.getKeys().contains('tasks')) {
      tasks = json.decode(_prefs.getString('tasks')!).map((key, value) {
        return MapEntry(key, Task.fromMap(value));
      }).cast<String, Task>();
    }
  }

  @override
  Future<void> deleteTask(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
