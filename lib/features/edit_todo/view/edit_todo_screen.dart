import 'package:flutter/material.dart';
import 'package:new_todo_app/features/edit_todo/view/widgets/save_button.dart';
import 'package:new_todo_app/features/edit_todo/view/widgets/todo_form.dart';
import 'package:new_todo_app/model/todo_model.dart';
import 'package:new_todo_app/utils/add_task_constants.dart';

class AddEditTodoScreen extends StatefulWidget {
  final Todo? existing;
  const AddEditTodoScreen({super.key, this.existing});

  @override
  State<AddEditTodoScreen> createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime? _deadline;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.existing?.title ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.existing?.description ?? '',
    );
    _deadline = widget.existing?.deadline;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isEdit ? AddEditConstants.editTitle : AddEditConstants.addTitle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AddEditConstants.screenPadding),
          child: TodoForm(
            formKey: _formKey,
            titleController: _titleController,
            descriptionController: _descriptionController,
            deadline: _deadline,
            onDeadlineChanged: _handleDeadlineChanged,
            onSave: _handleSave,
            isEdit: isEdit,
          ),
        ),
      ),
      bottomNavigationBar: _buildSaveButton(isEdit),
    );
  }

  Widget _buildSaveButton(bool isEdit) {
    return Padding(
      padding: const EdgeInsets.all(AddEditConstants.screenPadding),
      child: SaveButton(onPressed: _handleSave, isEdit: isEdit),
    );
  }

  void _handleDeadlineChanged(DateTime? newDeadline) {
    setState(() => _deadline = newDeadline);
  }

  void _handleSave() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final result = isEdit ? _createUpdatedTodo() : _createNewTodo();
    Navigator.pop(context, result);
  }

  Todo _createUpdatedTodo() {
    return widget.existing!.copyWith(
      title: _titleController.text.trim(),
      description:
          _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
      deadline: _deadline,
    );
  }

  Todo _createNewTodo() {
    return Todo(
      id: nextId(),
      title: _titleController.text.trim(),
      description:
          _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
      deadline: _deadline,
      isDone: false,
    );
  }

  bool get isEdit => widget.existing != null;
}
