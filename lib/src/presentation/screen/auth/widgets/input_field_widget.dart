import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller;
  final bool? enabled;

  const InputFieldWidget({
    super.key,
    required this.name,
    required this.controller,
    required this.hintText,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
