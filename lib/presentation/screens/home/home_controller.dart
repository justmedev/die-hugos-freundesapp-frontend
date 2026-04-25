import "package:diehugosapp/services/auth_service.dart";
import "package:get/get.dart";

class HomeController extends GetxController {
  HomeController({required this.authService});

  late final AuthService authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    if (!Get.find<AuthService>().isAuthenticated) await Get.offNamed("/login");
  }

  Future<void> logout() async {
    await authService.logout();
    await Get.offNamed("/login");
  }
}
