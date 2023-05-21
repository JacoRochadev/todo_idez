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
  List<Task>? _tasks;

  @observable
  ObservableList<Task> todoList = ObservableList<Task>();

  @observable
  bool checkedList = false;

  @observable
  FilterByTasks filter = FilterByTasks.all;

  @action
  void changeTasksList(List<Task> value) => todoList = value.asObservable();

  @action
  void addToList(List<Task> value) => todoList.addAll(value.asObservable());

  @action
  void removeToList(Task value) => todoList.remove(value);

  @action
  void changeCheckedList(bool? value) => checkedList = value ?? checkedList;

  @action
  void changeFilter(FilterByTasks value) => filter = value;

  @action
  Future<void> getTasks() async {
    await _repository.getTasks();
    changeTasksList(_repository.tasks.values.toList());
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

  void updateTaskList(Task tasks) {
    final index = todoList.indexWhere((element) => element.id == tasks.id);
    todoList[index] = tasks;
  }
}
