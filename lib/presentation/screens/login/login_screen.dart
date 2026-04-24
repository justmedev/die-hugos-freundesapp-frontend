import "package:diehugosapp/presentation/screens/login/login_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                          control: .managed(controller: _emailController),
                        ),
                        FTextField.password(
                          label: const Text("Passwort"),
                          control: .managed(controller: _passwordController),
                        ),
                      ],
                    ),

                    FButton(
                      onPress: () => controller.submitLogin(
                        _emailController.text,
                        _passwordController.text,
                      ),
                      // onPress: () => setState(() => _count++),
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

  Future<void> continueToAppIfJwt() async {
    // final prefs = await SharedPreferences.getInstance();
    // final jwt = prefs.getString("jwt");
    // if (jwt == null) return;
    // final payload = jsonDecode(
    //   utf8.decode(base64Url.decode('${jwt.split('.')[1]}=')),
    // );
    // if (payload["exp"] <= DateTime.now().millisecondsSinceEpoch / 1_000) {
    //   if (kDebugMode) print("JWT expired!");
    //   failedLoginToast();
    //   return; // Not valid anymore
    // }
    // if (mounted) {
    //   context.go("/");
    //   // context.pushReplacement(RouterDestinations.home.url);
    // }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  // }
}
