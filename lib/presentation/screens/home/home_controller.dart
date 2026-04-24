import "package:diehugosapp/data/services/auth_service.dart";
import "package:diehugosapp/presentation/screens/login/login_screen.dart";
import "package:get/get.dart";

class HomeController extends GetxController {
  HomeController({required this.authService});

  late final AuthService authService;

  Future<void> logout() async {
    await authService.logout();
    Get.off(LoginScreen.new);
  }
}
