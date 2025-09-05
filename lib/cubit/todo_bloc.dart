import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/cubit/todo_state.dart';
import 'package:new_todo_app/model/todo_model.dart';
import 'package:new_todo_app/repo/todo_repo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool loading;
  final String? error;

  const TodoState({required this.todos, this.loading = false, this.error});

  factory TodoState.initial() => const TodoState(todos: [], loading: false);

  TodoState copyWith({List<Todo>? todos, bool? loading, String? error}) =>
      TodoState(
        todos: todos ?? this.todos,
        loading: loading ?? this.loading,
        error: error,
      );

  @override
  List<Object?> get props => [todos, loading, error];
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repo;
  String? _email;

  TodoBloc(this._repo) : super(TodoState.initial()) {
    on<TodoLoaded>(_onLoaded);
    on<TodoReset>(_onReset);
    on<TodoAdded>(_onAdded);
    on<TodoUpdated>(_onUpdated);
    on<TodoDeleted>(_onDeleted);
    on<TodoToggled>(_onToggled);
  }

  Future<void> _persist() async {
    if (_email == null) return;
    await _repo.save(_email!, state.todos);
  }

  Future<void> _onLoaded(TodoLoaded e, Emitter<TodoState> emit) async {
    _email = e.email;
    emit(state.copyWith(loading: true, error: null));
    try {
      final list = await _repo.load(e.email);
      emit(state.copyWith(todos: list, loading: false));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  void _onReset(TodoReset e, Emitter<TodoState> emit) {
    _email = null;
    emit(TodoState.initial());
  }

  Future<void> _onAdded(TodoAdded e, Emitter<TodoState> emit) async {
    final list = [...state.todos, e.todo];
    emit(state.copyWith(todos: list));
    await _persist();
  }

  Future<void> _onUpdated(TodoUpdated e, Emitter<TodoState> emit) async {
    final list =
        state.todos.map((t) => t.id == e.todo.id ? e.todo : t).toList();
    emit(state.copyWith(todos: list));
    await _persist();
  }

  Future<void> _onDeleted(TodoDeleted e, Emitter<TodoState> emit) async {
    final list = state.todos.where((t) => t.id != e.id).toList();
    emit(state.copyWith(todos: list));
    await _persist();
  }

  Future<void> _onToggled(TodoToggled e, Emitter<TodoState> emit) async {
    final list =
        state.todos
            .map((t) => t.id == e.id ? t.copyWith(isDone: !t.isDone) : t)
            .toList();
    emit(state.copyWith(todos: list));
    await _persist();
  }
}
