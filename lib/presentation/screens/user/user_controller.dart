import "package:diehugosapp/services/auth_service.dart";
import "package:get/get.dart";

class UserController extends GetxController {
  UserController({required this.authService});

  late final AuthService authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    if (!Get.find<AuthService>().isAuthenticated) {
      await Get.offNamed<void>("/login");
    }
  }

  Future<void> logout() async {
    await authService.logout();
    await Get.offNamed<void>("/login");
  }
}
