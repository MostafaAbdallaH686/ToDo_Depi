import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_todo_app/model/todo_model.dart';
import 'package:new_todo_app/utils/todo_constants.dart';
import 'package:new_todo_app/features/todo/view/widgets/empty_state.dart';
import 'package:new_todo_app/features/todo/view/widgets/todo_title.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final String? userEmail;
  final ValueChanged<Todo> onToggle;
  final ValueChanged<Todo> onDelete;
  final ValueChanged<Todo> onEdit;

  const TodoList({
    super.key,
    required this.todos,
    required this.userEmail,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const TodoEmptyState();
    }

    return ListView.separated(
      itemCount: todos.length,
      separatorBuilder:
          (_, __) => SizedBox(
            height:
                MediaQuery.of(context).size.height * TodoConstants.listSpacing,
          ),
      itemBuilder: (context, index) {
        final todo = todos[index];
        final subtitle =
            todo.deadline != null
                ? '${TodoConstants.deadlinePrefix}${DateFormat.yMd().format(todo.deadline!)}'
                : null;

        return TodoTile(
          todo: todo,
          onToggle: () => onToggle(todo),
          onDelete: () => _showDeleteDialog(context, todo),
          onTap: () => onEdit(todo),
          subtitle: subtitle,
        );
      },
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, Todo todo) async {
    final confirm =
        await showDialog<bool>(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: const Text(TodoConstants.deleteDialogTitle),
                content: const Text(TodoConstants.deleteDialogContent),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: const Text(TodoConstants.cancelText),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: TodoConstants.deleteColor,
                    ),
                    onPressed: () => Navigator.pop(ctx, true),
                    child: const Text(TodoConstants.deleteText),
                  ),
                ],
              ),
        ) ??
        false;

    if (confirm) {
      onDelete(todo);
    }
  }
}
