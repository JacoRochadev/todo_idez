import 'package:flutter/material.dart';

import '../../../app/domain/enums/filter_by_tasks.dart';

class CustomButtonFilterComponent extends StatelessWidget {
  final FilterByTasks value;
  final bool isSelected;
  final VoidCallback onPressed;
  const CustomButtonFilterComponent(
      {super.key,
      required this.value,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: shape,
          backgroundColor:
              isSelected ? Theme.of(context).primaryColor : Colors.grey[200]),
      child: Text(
        value.name,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  RoundedRectangleBorder get shape {
    switch (value) {
      case FilterByTasks.all:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        );
      case FilterByTasks.pending:
        return const RoundedRectangleBorder();
      case FilterByTasks.done:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        );
      default:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        );
    }
  }
}
