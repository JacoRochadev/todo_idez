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

  late final _$_tasksAtom =
      Atom(name: '_HomeStoreBase._tasks', context: context);

  @override
  List<Task>? get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(List<Task>? value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

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

  late final _$checkedListAtom =
      Atom(name: '_HomeStoreBase.checkedList', context: context);

  @override
  bool get checkedList {
    _$checkedListAtom.reportRead();
    return super.checkedList;
  }

  @override
  set checkedList(bool value) {
    _$checkedListAtom.reportWrite(value, super.checkedList, () {
      super.checkedList = value;
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
  void addToList(List<Task> value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addToList');
    try {
      return super.addToList(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeToList(Task value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.removeToList');
    try {
      return super.removeToList(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCheckedList(bool? value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeCheckedList');
    try {
      return super.changeCheckedList(value);
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
checkedList: ${checkedList},
filter: ${filter},
filteredList: ${filteredList}
    ''';
  }
}
