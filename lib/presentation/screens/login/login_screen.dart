import "dart:convert";

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:forui/forui.dart";
import "package:go_router/go_router.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => continueToAppIfJwt(),
    );
  }

  @override
  Widget build(BuildContext context) => Center(
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
                    controller: _emailController, // TextEditingController
                  ),
                  FTextField.password(
                    label: const Text("Passwort"),
                    controller: _passwordController, // TextEditingController
                  ),
                ],
              ),

              FButton(
                onPress: authAndGoHome,
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

  Future<void> authAndGoHome() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      failedLoginToast();
      return;
    }

    final response = await http.post(
      Uri.http("localhost:8000", "/auth/login"),
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode != 200) {
      if (kDebugMode) {
        print("auth response not ok!");
      }
      failedLoginToast();
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("jwt", jsonDecode(response.body)["jwt"]);
    if (kDebugMode) {
      print("Set jwt!");
    }
    continueToAppIfJwt();
  }

  Future<void> continueToAppIfJwt() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString("jwt");
    if (jwt == null) return;
    final payload = jsonDecode(
      utf8.decode(base64Url.decode('${jwt.split('.')[1]}=')),
    );
    if (payload["exp"] <= DateTime.now().millisecondsSinceEpoch / 1_000) {
      if (kDebugMode) print("JWT expired!");
      failedLoginToast();
      return; // Not valid anymore
    }
    if (mounted) {
      context.go("/");
      // context.pushReplacement(RouterDestinations.home.url);
    }
  }

  void failedLoginToast() {
    showFToast(
      context: context,
      alignment: FToastAlignment.topCenter,
      icon: const Icon(FIcons.triangleAlert),
      swipeToDismiss: [AxisDirection.up],
      title: const Text("Die Anmeldung war nicht erfolgreich!"),
      description: const Text("Sind Email & Passwort korrekt?"),
    );
  }
}
