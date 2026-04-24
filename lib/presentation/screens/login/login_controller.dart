import "package:diehugosapp/data/services/auth_service.dart";
import "package:diehugosapp/data/services/toaster_service.dart";
import "package:diehugosapp/presentation/screens/home/home_screen.dart";
import "package:flutter/widgets.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class LoginController extends GetxController {
  LoginController({required this.authService});

  late final AuthService authService;

  RxBool isLoading = false.obs;

  Future<void> submitLogin(String email, String password) async {
    final toastService = Get.find<ToastService>();
    isLoading.value = true;

    try {
      await authService.login(email, password);

      if (authService.isAuthenticated) {
        await Get.off(() => const HomeScreen());
      }
    } on WrongCredentials {
      toastService.show(
        title: "Die Anmeldung war nicht erfolgreich!",
        description: "Sind E-mail und Passwort korrekt?",
        icon: const Icon(FIcons.triangleAlert),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
