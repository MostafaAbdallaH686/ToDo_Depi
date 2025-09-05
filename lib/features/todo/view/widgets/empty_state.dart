import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/todo_constants.dart';

class TodoEmptyState extends StatelessWidget {
  const TodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(TodoConstants.emptyStateText));
  }
}
