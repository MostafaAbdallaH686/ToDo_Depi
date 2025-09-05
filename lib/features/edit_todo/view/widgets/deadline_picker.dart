import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class DeadlinePicker extends StatelessWidget {
  final DateTime? deadline;
  final ValueChanged<DateTime?> onDeadlineChanged;

  const DeadlinePicker({
    super.key,
    required this.deadline,
    required this.onDeadlineChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AddEditConstants.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(AddEditConstants.cardPadding),
        child: InputDecorator(
          decoration: const InputDecoration(
            labelText: AddEditConstants.deadlineLabel,
            border: OutlineInputBorder(),
            prefixIcon: Icon(AddEditConstants.deadlineIcon),
          ),
          child: InkWell(
            onTap: () => _showDatePicker(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deadline == null
                      ? AddEditConstants.deadlinePlaceholder
                      : DateFormat.yMd().format(deadline!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: deadline ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );

    if (picked != null) {
      onDeadlineChanged(picked);
    }
  }
}
