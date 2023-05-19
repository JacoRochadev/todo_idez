import 'package:mobx/mobx.dart';
import 'package:todo_idez/app/domain/entities/item_list.dart';
import 'package:todo_idez/app/domain/enums/filter_by_tasks.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<ItemList> todoList = ObservableList<ItemList>();

  @observable
  bool checkedList = false;

  @observable
  FilterByTasks filter = FilterByTasks.all;

  @action
  void addToList(List<ItemList> value) => todoList.addAll(value.asObservable());

  @action
  void changeCheckedList(bool? value) => checkedList = value ?? checkedList;

  @action
  void changeFilter(FilterByTasks value) => filter = value;

  @computed
  List<ItemList> get filteredList {
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
