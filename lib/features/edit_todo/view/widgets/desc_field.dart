import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AddEditConstants.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(AddEditConstants.cardPadding),
        child: TextFormField(
          controller: controller,
          minLines: 3,
          maxLines: 6,
          decoration: const InputDecoration(
            labelText: AddEditConstants.descriptionLabel,
            hintText: AddEditConstants.descriptionHint,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
