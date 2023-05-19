import 'package:flutter/material.dart';

class CustomTextFieldComponent extends StatelessWidget {
  final String hint;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  const CustomTextFieldComponent({
    super.key,
    required this.hint,
    this.textEditingController,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
