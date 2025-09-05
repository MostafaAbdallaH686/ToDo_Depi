import 'dart:convert';
import 'package:new_todo_app/model/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  final SharedPreferences _prefs;
  TodoRepository(this._prefs);

  String _keyFor(String email) => 'todos_${email.toLowerCase().trim()}';

  Future<List<Todo>> load(String email) async {
    final raw = _prefs.getString(_keyFor(email));
    if (raw == null || raw.isEmpty) return [];
    final list =
        (json.decode(raw) as List)
            .cast<Map<String, dynamic>>()
            .map(Todo.fromMap)
            .toList();
    return list;
  }

  Future<void> save(String email, List<Todo> todos) async {
    final data = json.encode(todos.map((e) => e.toMap()).toList());
    await _prefs.setString(_keyFor(email), data);
  }

  Future<void> clearFor(String email) async {
    await _prefs.remove(_keyFor(email));
  }
}
