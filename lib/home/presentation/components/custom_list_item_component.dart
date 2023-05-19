import 'package:flutter/material.dart';

class CustomListItemComponent extends StatelessWidget {
  final String title;
  final bool checked;
  final void Function(bool?) onTap;
  final VoidCallback deleteItem;
  const CustomListItemComponent({
    super.key,
    required this.title,
    required this.checked,
    required this.onTap,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        value: checked,
        onChanged: onTap,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: checked == true
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
