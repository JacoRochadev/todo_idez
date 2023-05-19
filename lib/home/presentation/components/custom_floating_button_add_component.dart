import 'package:flutter/material.dart';

import 'custom_text_field_component.dart';

class CustomFloatingButtonAddComponent extends StatelessWidget {
  final TextEditingController titleTextEditingController;
  final String label;
  final VoidCallback onPressed;
  final VoidCallback onDismiss;
  final IconData icon;

  const CustomFloatingButtonAddComponent({
    super.key,
    required this.titleTextEditingController,
    required this.label,
    required this.onPressed,
    required this.onDismiss,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              content: CustomTextFieldComponent(
                textEditingController: titleTextEditingController,
                hint: 'Adicione uma tarefa',
                keyboardType: TextInputType.text,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onDismiss,
                      child: const Text('Fechar'),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Icon(icon),
    );
  }
}
