import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/todo_constants.dart';

class TodoLoadingIndicator extends StatelessWidget {
  const TodoLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: TodoConstants.primaryColor),
    );
  }
}
