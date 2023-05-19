import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_idez/app/domain/entities/item_list.dart';
import 'package:todo_idez/app/domain/enums/filter_by_tasks.dart';
import 'package:todo_idez/home/presentation/components/custom_list_item_component.dart';

import '../application/home_store.dart';
import 'components/custom_button_filter_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();

  List<ItemList> todoListMock = [
    ItemList(title: 'teste 1', checked: false),
    ItemList(title: 'teste 2', checked: false),
  ];
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
                    const Text('Nenhum item adicionado'),
                  ...controller.todoList.map(
                    (element) => CustomListItemComponent(
                      title: element.title,
                      checked: false,
                      onTap: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      //TODO AQUI COLOCAR O BOTÃO DE ADICIONAR COM A FUNÇAÕ
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addToList(todoListMock);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}