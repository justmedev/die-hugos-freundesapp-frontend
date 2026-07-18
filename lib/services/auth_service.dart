import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:flutter/foundation.dart";
import "package:get/get.dart";

class WrongCredentials implements Exception {}

class AuthService extends GetxService {
  AuthService(this.authRepo, this.sessionManager);

  late final AuthRepo authRepo;
  late final SessionManager sessionManager;

  final RxBool _isLoggedIn = false.obs;
  final Rxn<AuthSession?> _authState = Rxn<AuthSession>();

  User? get user => _authState.value?.user;

  String? get accessToken => _authState.value?.accessToken;

  bool get isAuthenticated => _isLoggedIn.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    _authState.value = sessionManager.currentSession;
    _isLoggedIn.value = sessionManager.currentSession != null;

    sessionManager.sessionStream.listen((session) {
      _authState.value = session;
      _isLoggedIn.value = session != null;
    });

    ever(_isLoggedIn, (isLoggedIn) async => redirectIfNotLoggedIn());
  }

  Future<void> redirectIfNotLoggedIn() async {
    if (!_isLoggedIn.value && Get.currentRoute != "/login") {
      await Get.offAllNamed<void>("/login");
    }
  }

  Future<void> login() async {
    if (_isLoggedIn.value) return;
    try {
      await authRepo.login();
    } on Exception catch (e) {
      debugPrint("Login failed: $e");
    }
  }

  void replaceUser(User user) {
    _authState.value = AuthSession(
      accessToken: _authState.value!.accessToken,
      refreshToken: _authState.value!.refreshToken,
      user: user,
    );
  }

  Future<void> authLocally() async {
    if (_isLoggedIn.value) return;
    await authRepo.authLocally();
  }

  Future<void> logout() async {
    await sessionManager.clearSession();
    await authRepo.logout();
  }
}
