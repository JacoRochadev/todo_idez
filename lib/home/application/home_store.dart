import 'package:mobx/mobx.dart';
import 'package:todo_idez/app/domain/entities/task.dart';
import 'package:todo_idez/app/domain/enums/filter_by_tasks.dart';
import 'package:todo_idez/home/domain/tasks_interface.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final TasksInterface _repository;

  _HomeStoreBase(this._repository);

  @observable
  ObservableList<Task> todoList = ObservableList<Task>();

  @observable
  FilterByTasks filter = FilterByTasks.all;

  @action
  void changeTasksList(List<Task> value) => todoList = value.asObservable();

  @action
  void changeFilter(FilterByTasks value) => filter = value;

  @action
  Future<void> getAllTasks() async {
    await _repository.initializePersistenceModule();
    final tasks_ = await _repository.getTasks();
    changeTasksList(tasks_);
  }

  @action
  Future<void> addTask(Task task) async {
    final task_ = await _repository.saveTask(task);
    todoList.add(task_);
  }

  @action
  Future<void> deleteTask(Task task) async {
    _repository.deleteTask(task);
    todoList.remove(task);
  }

  @action
  Future<void> updateTaskList(Task tasksOld, Task tasksNew) async {
    await _repository.updateTask(tasksOld, tasksNew);
    final index = todoList.indexOf(tasksOld);
    todoList[index] = tasksNew;
  }

  @computed
  List<Task> get filteredList {
    switch (filter) {
      case FilterByTasks.all:
        return todoList;
      case FilterByTasks.pending:
        return todoList.where((element) => !element.checked).toList();
      case FilterByTasks.done:
        return todoList.where((element) => element.checked).toList();
      default:
        return todoList;
    }
  }
}
