import "dart:convert";

import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:get/get_rx/src/rx_types/rx_types.dart";
import "package:shared_preferences/shared_preferences.dart";

class SessionManager {
  SessionManager(this.prefs) {
    _loadFromDisk();
  }

  final SharedPreferences prefs;
  static const String _statePrefKey = "authState";

  final Rxn<AuthSession> _cachedSession = Rxn<AuthSession>();

  Stream<AuthSession?> get sessionStream => _cachedSession.stream;

  AuthSession? get currentSession => _cachedSession.value;

  void _loadFromDisk() {
    final stringified = prefs.getString(_statePrefKey);
    if (stringified == null) {
      _cachedSession.value = null;
      return;
    }
    _cachedSession.value = AuthSession.fromJson(
      jsonDecode(stringified) as Map<String, Object?>,
    );
  }

  Future<void> saveSession(AuthSession state) async {
    _cachedSession.value = state;
    await prefs.setString(_statePrefKey, jsonEncode(state));
  }

  Future<void> clearSession() async {
    _cachedSession.value = null;
    await prefs.remove(_statePrefKey);
  }
}
