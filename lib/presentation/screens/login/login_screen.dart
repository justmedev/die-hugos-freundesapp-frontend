import "package:diehugosapp/presentation/screens/login/login_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    child: Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FCircularProgress(),
                SizedBox(height: 10),
                Text("Logging you in ..."),
              ],
            ),
          );
        }

        return Center(
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
                  "Bei Passwortzurücksetzung bitte bei Ilja melden :)",
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        FTextField.email(
                          control: .managed(
                            controller: controller.emailController.value,
                          ),
                        ),
                        FTextField.password(
                          label: const Text("Passwort"),
                          control: .managed(
                            controller: controller.passwordController.value,
                          ),
                        ),
                      ],
                    ),

                    FButton(
                      onPress: () => controller.submitLogin(),
                      suffix: const Icon(FIcons.lock),
                      child: const Text("Anmelden"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
