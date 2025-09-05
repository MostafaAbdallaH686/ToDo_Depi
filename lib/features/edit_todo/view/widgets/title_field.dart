import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class TitleField extends StatelessWidget {
  final TextEditingController controller;

  const TitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AddEditConstants.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(AddEditConstants.cardPadding),
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: AddEditConstants.titleLabel,
            border: OutlineInputBorder(),
          ),
          validator:
              (v) =>
                  (v == null || v.trim().isEmpty)
                      ? AddEditConstants.requiredError
                      : null,
        ),
      ),
    );
  }
}
