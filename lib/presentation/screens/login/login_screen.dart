import "package:diehugosapp/presentation/screens/login/login_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    title: const Text("Anmelden"),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const Text(
            "⬇️ Die Hugos ⬇️",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          FCard(
            title: const Text("Anmelden 🔐"),
            subtitle: const Text(
              "Die Anmeldung läuft über ein Browserfenster!",
            ),
            child: Column(
              spacing: 20,
              children: [
                Obx(
                  () => FButton(
                    prefix: controller.isLoading.value
                        ? const FCircularProgress()
                        : null,
                    onPress: controller.isLoading.value
                        ? null
                        : () => controller.submitLogin(),
                    suffix: const Icon(FIcons.lock),
                    child: const Text("Mit E-mail anmelden"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
