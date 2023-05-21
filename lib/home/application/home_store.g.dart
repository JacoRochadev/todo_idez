// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<List<Task>>? _$filteredListComputed;

  @override
  List<Task> get filteredList =>
      (_$filteredListComputed ??= Computed<List<Task>>(() => super.filteredList,
              name: '_HomeStoreBase.filteredList'))
          .value;

  late final _$todoListAtom =
      Atom(name: '_HomeStoreBase.todoList', context: context);

  @override
  ObservableList<Task> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(ObservableList<Task> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_HomeStoreBase.filter', context: context);

  @override
  FilterByTasks get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterByTasks value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$getAllTasksAsyncAction =
      AsyncAction('_HomeStoreBase.getAllTasks', context: context);

  @override
  Future<void> getAllTasks() {
    return _$getAllTasksAsyncAction.run(() => super.getAllTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_HomeStoreBase.addTask', context: context);

  @override
  Future<void> addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_HomeStoreBase.deleteTask', context: context);

  @override
  Future<void> deleteTask(Task task) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(task));
  }

  late final _$updateTaskListAsyncAction =
      AsyncAction('_HomeStoreBase.updateTaskList', context: context);

  @override
  Future<void> updateTaskList(Task tasksOld, Task tasksNew) {
    return _$updateTaskListAsyncAction
        .run(() => super.updateTaskList(tasksOld, tasksNew));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void changeTasksList(List<Task> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeTasksList');
    try {
      return super.changeTasksList(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilter(FilterByTasks value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeFilter');
    try {
      return super.changeFilter(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoList: ${todoList},
filter: ${filter},
filteredList: ${filteredList}
    ''';
  }
}
