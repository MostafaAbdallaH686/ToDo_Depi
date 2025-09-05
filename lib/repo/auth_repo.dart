import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const _currentKey = 'current_user_email';
  final SharedPreferences _prefs;
  AuthRepository(this._prefs);

  String? get currentEmail => _prefs.getString(_currentKey);

  Future<void> setCurrentEmail(String email) async {
    await _prefs.setString(_currentKey, email.toLowerCase().trim());
  }

  Future<void> signOut() async {
    await _prefs.remove(_currentKey);
  }
}
