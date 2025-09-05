import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/cubit/auth_state.dart';
import 'package:new_todo_app/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit(this._repo) : super(const Unauthenticated());

  void bootstrap() {
    final email = _repo.currentEmail;
    if (email != null && email.isNotEmpty) {
      emit(Authenticated(email));
    }
  }

  Future<void> login(String email) async {
    final normalized = email.toLowerCase().trim();
    if (normalized.isEmpty || !normalized.contains('@')) {
      emit(const Unauthenticated());
      return;
    }
    await _repo.setCurrentEmail(normalized);
    emit(Authenticated(normalized));
  }

  Future<void> logout() async {
    await _repo.signOut();
    emit(const Unauthenticated());
  }
}
