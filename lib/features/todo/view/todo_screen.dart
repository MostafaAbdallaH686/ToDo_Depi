// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/cubit/auth_cubit.dart';
import 'package:new_todo_app/cubit/auth_state.dart';
import 'package:new_todo_app/cubit/todo_bloc.dart';
import 'package:new_todo_app/cubit/todo_state.dart';
import 'package:new_todo_app/model/todo_model.dart';
import 'package:new_todo_app/utils/todo_constants.dart';
import 'package:new_todo_app/features/edit_todo/view/edit_todo_screen.dart';
import 'package:new_todo_app/features/todo/view/widgets/loading_indictor.dart';
import 'package:new_todo_app/features/todo/view/widgets/search_field.dart';
import 'package:new_todo_app/features/todo/view/widgets/todo_list.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  String _query = '';
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final h = mq.height;
    final w = mq.width;

    return Scaffold(
      appBar: _buildAppBar(w),
      body: _buildBody(h, w),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar(double width) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        TodoConstants.appBarTitle,
        style: TodoConstants.appBarTitleStyle,
      ),
      leading: IconButton(
        icon: const Icon(Icons.logout, color: TodoConstants.iconColor),
        onPressed: () => context.read<AuthCubit>().logout(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            _showSearch ? Icons.close : Icons.search,
            color: TodoConstants.iconColor,
          ),
          onPressed: () => setState(() => _showSearch = !_showSearch),
        ),
        SizedBox(width: width * TodoConstants.searchIconSpacing),
      ],
    );
  }

  Widget _buildBody(double height, double width) {
    return Padding(
      padding: EdgeInsets.all(width * TodoConstants.horizontalPadding),
      child: Column(
        children: [
          if (_showSearch) _buildSearchSection(height),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }

  Widget _buildSearchSection(double height) {
    return Column(
      children: [
        SearchField(
          query: _query,
          onChanged: (v) => setState(() => _query = v.toLowerCase()),
        ),
        SizedBox(height: height * TodoConstants.listSpacing),
      ],
    );
  }

  Widget _buildTodoList() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state.loading) {
          return const TodoLoadingIndicator();
        }

        final filteredTodos =
            state.todos
                .where(
                  (t) =>
                      t.title.toLowerCase().contains(_query) ||
                      (t.description ?? '').toLowerCase().contains(_query),
                )
                .toList();

        return TodoList(
          todos: filteredTodos,
          userEmail: _getUserEmail(context),
          onToggle: (todo) => _toggleTodo(context, todo),
          onDelete: (todo) => _deleteTodo(context, todo),
          onEdit: (todo) => _editTodo(context, todo),
        );
      },
    );
  }

  Widget? _buildFloatingActionButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, auth) {
        if (auth is! Authenticated) return const SizedBox.shrink();

        return FloatingActionButton(
          backgroundColor: TodoConstants.fabColor,
          onPressed: () => _addTodo(context, auth.email),
          child: const Icon(Icons.add, color: TodoConstants.fabIconColor),
        );
      },
    );
  }

  String? _getUserEmail(BuildContext context) {
    final auth = context.read<AuthCubit>().state;
    return auth is Authenticated ? auth.email : null;
  }

  void _toggleTodo(BuildContext context, Todo todo) {
    final email = _getUserEmail(context);
    if (email != null) {
      context.read<TodoBloc>().add(TodoToggled(email, todo.id));
    }
  }

  void _deleteTodo(BuildContext context, Todo todo) {
    final email = _getUserEmail(context);
    if (email != null) {
      context.read<TodoBloc>().add(TodoDeleted(email, todo.id));
    }
  }

  Future<void> _editTodo(BuildContext context, Todo todo) async {
    final email = _getUserEmail(context);
    if (email == null) return;

    final updated = await Navigator.push<Todo?>(
      context,
      MaterialPageRoute(builder: (_) => AddEditTodoScreen(existing: todo)),
    );

    if (updated != null) {
      context.read<TodoBloc>().add(TodoUpdated(email, updated));
    }
  }

  Future<void> _addTodo(BuildContext context, String email) async {
    final created = await Navigator.push<Todo?>(
      context,
      MaterialPageRoute(builder: (_) => const AddEditTodoScreen()),
    );

    if (created != null) {
      context.read<TodoBloc>().add(TodoAdded(email, created));
    }
  }
}
