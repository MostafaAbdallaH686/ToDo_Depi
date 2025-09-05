import 'package:equatable/equatable.dart';
import 'package:new_todo_app/model/todo_model.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

final class TodoLoaded extends TodoEvent {
  final String email;
  const TodoLoaded(this.email);
  @override
  List<Object?> get props => [email];
}

final class TodoReset extends TodoEvent {
  const TodoReset();
}

final class TodoAdded extends TodoEvent {
  final String email;
  final Todo todo;
  const TodoAdded(this.email, this.todo);
  @override
  List<Object?> get props => [email, todo];
}

final class TodoUpdated extends TodoEvent {
  final String email;
  final Todo todo;
  const TodoUpdated(this.email, this.todo);
  @override
  List<Object?> get props => [email, todo];
}

final class TodoDeleted extends TodoEvent {
  final String email;
  final String id;
  const TodoDeleted(this.email, this.id);
  @override
  List<Object?> get props => [email, id];
}

final class TodoToggled extends TodoEvent {
  final String email;
  final String id;
  const TodoToggled(this.email, this.id);
  @override
  List<Object?> get props => [email, id];
}
