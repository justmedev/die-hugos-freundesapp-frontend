import "package:diehugosapp/data/models/auth/auth_state/auth_state.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:dio/dio.dart";
import "package:get/get.dart";

class WrongCredentials implements Exception {}

class AuthService extends GetxService {
  final RxBool _isLoggedIn = false.obs;
  final Rxn<AuthState?> _authState = Rxn<AuthState>();

  User? get user => _authState.value?.user;

  String? get token => _authState.value?.jwt;

  bool get isAuthenticated => _isLoggedIn.value;

  Future<void> login(String email, String password) async {
    if (_isLoggedIn.value) return;
    final authRepo = Get.find<AuthRepo>();
    try {
      final res = await authRepo.login(email, password);
      _authState.value = AuthState(jwt: res.jwt, user: res.user);
      _isLoggedIn.value = true;
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          throw WrongCredentials();
        }
      }
      _isLoggedIn.value = false;
      _authState.value = null;
      rethrow;
    }
  }

  Future<void> authLocally() async {
    if (_isLoggedIn.value) return;
    final authRepo = Get.find<AuthRepo>();
    _authState.value = await authRepo.authLocally();
    _isLoggedIn.value = user != null;
  }

  Future<void> logout() async {
    Get.find<AuthRepo>().logout();
    _isLoggedIn.value = false;
    _authState.value = null;
  }
}
