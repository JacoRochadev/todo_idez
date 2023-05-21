import 'package:flutter/material.dart';
import 'package:todo_idez/app/domain/entities/task.dart';

typedef CompleteTaskCallback = void Function(Task, bool);

class CustomListItemComponent extends StatefulWidget {
  const CustomListItemComponent({
    super.key,
    required this.element,
    required this.checked,
    required this.onTap,
    required this.deleteItem,
    required this.onDone,
  });

  final Task element;
  final bool checked;
  final void Function(bool?) onTap;
  final VoidCallback deleteItem;
  final CompleteTaskCallback onDone;

  @override
  State<CustomListItemComponent> createState() =>
      _CustomListItemComponentState();
}

class _CustomListItemComponentState extends State<CustomListItemComponent> {
  bool done = false;

  void changeCompleted(bool value) {
    done = value;
    setState(() {});

    widget.onDone(widget.element, value);
  }

  @override
  void initState() {
    super.initState();
    done = widget.element.checked;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        value: done,
        onChanged: (value) {
          if (value == null) return;
          changeCompleted(value);
        },
      ),
      title: Text(
        widget.element.title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: done == true ? Colors.grey[600] : Colors.black,
              fontWeight: FontWeight.bold,
              decoration: done == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: widget.deleteItem,
      ),
    );
  }
}
