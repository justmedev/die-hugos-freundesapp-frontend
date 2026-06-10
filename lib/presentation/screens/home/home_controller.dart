import "package:diehugosapp/services/auth_service.dart";
import "package:get/get.dart";

class HomeController extends GetxController {
  HomeController({required this.authService});

  late final AuthService authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    await authService.redirectIfNotLoggedIn();
  }
}
