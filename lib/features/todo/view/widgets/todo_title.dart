import 'package:flutter/material.dart';
import 'package:new_todo_app/model/todo_model.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final String? subtitle;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width * 0.03;
    final paddingH = size.width * 0.02;
    final paddingV = size.height * 0.005;

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingH,
            vertical: paddingV,
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            leading: Transform.scale(
              scale: 1.4,
              child: Checkbox(
                value: todo.isDone,
                onChanged: (_) => onToggle(),
                activeColor: Colors.blueAccent,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                side: const BorderSide(width: 1.5, color: Colors.grey),
              ),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
                color:
                    todo.isDone
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                fontSize: size.width * 0.045,
              ),
            ),
            subtitle:
                subtitle == null
                    ? null
                    : Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.redAccent,
                size: size.width * 0.06,
              ),
              onPressed: onDelete,
            ),
          ),
        ),
      ),
    );
  }
}
