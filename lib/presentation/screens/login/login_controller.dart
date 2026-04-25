import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/widgets.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class LoginController extends GetxController {
  LoginController({required this.authService});

  late final AuthService authService;

  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  RxBool isLoading = false.obs;

  Future<void> submitLogin() async {
    final toastService = Get.find<ToastService>();
    isLoading.value = true;

    try {
      await authService.login(
        emailController.value.text,
        passwordController.value.text,
      );

      if (authService.isAuthenticated) {
        await Get.offNamed("/");
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

  @override
  void dispose() {
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }
}
