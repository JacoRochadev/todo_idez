import 'package:flutter/material.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String hint;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  const CustomTextFieldComponent({
    super.key,
    required this.hint,
    this.textEditingController,
    required this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        contentPadding: const EdgeInsets.only(left: 10, bottom: 0),
      ),
    );
  }
}
