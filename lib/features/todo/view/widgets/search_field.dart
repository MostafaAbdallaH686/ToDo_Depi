import 'package:flutter/material.dart';
import 'package:new_todo_app/utils/todo_constants.dart';

class SearchField extends StatelessWidget {
  final String query;
  final ValueChanged<String> onChanged;

  const SearchField({super.key, required this.query, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: TodoConstants.searchHint,
        prefixIcon: const Icon(Icons.search, color: TodoConstants.primaryColor),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TodoConstants.primaryColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TodoConstants.primaryColor, width: 2),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
