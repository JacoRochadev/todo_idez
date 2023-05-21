import 'package:flutter/material.dart';
import 'package:todo_idez/app/domain/entities/task.dart';

typedef CompleteTaskCallback = void Function(Task, bool);

class CustomListItemComponent extends StatelessWidget {
  const CustomListItemComponent({
    super.key,
    required this.element,
    required this.deleteItem,
    required this.onDone,
  });

  final Task element;
  final VoidCallback deleteItem;
  final ValueChanged<bool> onDone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        value: element.checked,
        onChanged: (value) {
          if (value == null) return;
          onDone(value);
        },
      ),
      title: Text(
        element.title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: element.checked == true ? Colors.grey[600] : Colors.black,
              fontWeight: FontWeight.bold,
              decoration: element.checked == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: deleteItem,
      ),
    );
  }
}
