import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:dio/dio.dart";
import "package:get/get.dart";

class WrongCredentials implements Exception {}

class AuthService extends GetxService {
  final RxBool _isLoggedIn = false.obs;

  // final RxString _token = "".obs;

  bool get isAuthenticated => _isLoggedIn.value;

  Future<void> login(String email, String password) async {
    if (_isLoggedIn.value) return;
    final authRepo = Get.find<AuthRepo>();
    try {
      // _token.value =
      await authRepo.login(email, password);
      _isLoggedIn.value = true;
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          throw WrongCredentials();
        }
      }
      _isLoggedIn.value = false;
      // _token.value = "";
      rethrow;
    }
  }

  Future<void> authLocally() async {
    if (_isLoggedIn.value) return;
    final authRepo = Get.find<AuthRepo>();
    _isLoggedIn.value = await authRepo.authLocally();
  }
}
