import 'package:flutter/material.dart';
import 'package:new_todo_app/features/edit_todo/view/widgets/deadline_picker.dart';
import 'package:new_todo_app/features/edit_todo/view/widgets/desc_field.dart';
import 'package:new_todo_app/features/edit_todo/view/widgets/title_field.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class TodoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final DateTime? deadline;
  final ValueChanged<DateTime?> onDeadlineChanged;
  final VoidCallback onSave;
  final bool isEdit;

  const TodoForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    required this.deadline,
    required this.onDeadlineChanged,
    required this.onSave,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TitleField(controller: titleController),
          const SizedBox(height: AddEditConstants.spacing),
          DescriptionField(controller: descriptionController),
          const SizedBox(height: AddEditConstants.spacing),
          DeadlinePicker(
            deadline: deadline,
            onDeadlineChanged: onDeadlineChanged,
          ),
        ],
      ),
    );
  }
}
