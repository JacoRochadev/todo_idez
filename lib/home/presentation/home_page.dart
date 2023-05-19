import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_idez/app/domain/enums/filter_by_tasks.dart';
import 'package:todo_idez/home/presentation/components/custom_list_item_component.dart';

import '../application/home_store.dart';
import 'components/custom_button_filter_component.dart';
import 'components/home_page_add_task_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();
  final _titleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List'),
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4, right: 4, bottom: 10),
                    child: Row(
                      children: FilterByTasks.values
                          .map(
                            (e) => Expanded(
                              child: CustomButtonFilterComponent(
                                value: e,
                                isSelected: e == controller.filter,
                                onPressed: () => controller.changeFilter(e),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (controller.todoList.isEmpty)
                    const Center(
                      child: Text('Adicione uma nova tarefa!'),
                    ),
                  ...controller.filteredList.map(
                    (element) => CustomListItemComponent(
                      title: element.title,
                      checked: controller.checkedList,
                      onTap: controller.changeCheckedList,
                      deleteItem: () => controller.removeToList(element),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HomePageTaskDialog.show(
            context: context,
            onAddTask: (value) {
              controller.addToList([value]);
              Navigator.pop(context);
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
