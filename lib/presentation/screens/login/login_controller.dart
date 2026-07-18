import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/widgets.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class LoginController extends GetxController {
  LoginController({required this.authService});

  late final AuthService authService;

  RxBool isLoading = false.obs;

  Future<void> submitLogin() async {
    isLoading.value = true;

    try {
      await authService.login();

      if (authService.isAuthenticated) {
        await Get.offNamed<void>("/");
      }
    } on Exception catch (e) {
      Get.find<ToastService>().show(
        title: "Die Anmeldung war nicht erfolgreich!",
        description: "Fehler: $e",
        icon: const Icon(FIcons.triangleAlert),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
