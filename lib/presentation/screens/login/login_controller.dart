import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/widgets.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class LoginController extends GetxController {
  LoginController({required this.authService});

  late final AuthService authService;

  Rx<TextEditingValue> email = TextEditingValue.empty.obs;
  Rx<TextEditingValue> password = TextEditingValue.empty.obs;
  RxBool isLoading = false.obs;

  Future<void> submitLogin() async {
    final toastService = Get.find<ToastService>();
    isLoading.value = true;

    try {
      await authService.login(
        email.value.text,
        password.value.text,
      );

      if (authService.isAuthenticated) {
        await Get.offNamed<void>("/");
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
