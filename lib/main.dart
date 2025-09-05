import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/cubit/auth_cubit.dart';
import 'package:new_todo_app/cubit/auth_state.dart';
import 'package:new_todo_app/cubit/todo_bloc.dart';
import 'package:new_todo_app/cubit/todo_state.dart';
import 'package:new_todo_app/repo/auth_repo.dart';
import 'package:new_todo_app/repo/todo_repo.dart';
import 'package:new_todo_app/features/login/view/login-screen.dart';
import 'package:new_todo_app/features/todo/view/todo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final authRepo = AuthRepository(prefs);
  final todoRepo = TodoRepository(prefs);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepo),
        RepositoryProvider.value(value: todoRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit(authRepo)..bootstrap()),
          BlocProvider(create: (_) => TodoBloc(todoRepo)),
        ],
        child: const TodoApp(),
      ),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F6CE5)),
        useMaterial3: true,
      ),
      home: BlocListener<AuthCubit, AuthState>(
        listenWhen: (p, c) => p.runtimeType != c.runtimeType,
        listener: (context, state) {
          if (state is Authenticated) {
            context.read<TodoBloc>().add(TodoLoaded(state.email));
          } else {
            context.read<TodoBloc>().add(const TodoReset());
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) return const TodosScreen();
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
