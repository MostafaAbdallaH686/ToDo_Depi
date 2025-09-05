import 'dart:convert';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String? description;
  final DateTime? deadline;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    this.description,
    this.deadline,
    this.isDone = false,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'deadline': deadline?.toIso8601String(),
    'isDone': isDone,
  };

  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
    id: map['id'] as String,
    title: map['title'] as String,
    description: map['description'] as String?,
    deadline:
        map['deadline'] == null
            ? null
            : DateTime.parse(map['deadline'] as String),
    isDone: map['isDone'] as bool? ?? false,
  );

  String toJson() => json.encode(toMap());
  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, title, description, deadline, isDone];
}

// أداة خفيفة لتوليد ID بدون حزمة إضافية
String nextId() => DateTime.now().microsecondsSinceEpoch.toString();
