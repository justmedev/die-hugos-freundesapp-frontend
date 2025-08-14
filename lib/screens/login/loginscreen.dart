
import 'package:flutter/cupertino.dart';
import 'package:forui/forui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => FScaffold(
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Text("⬇️ Die Hugos ⬇️", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),

          FCard(
            title: const Text('Anmelden 🔐'),
            subtitle: const Text(
              'Bei Passwortzurücksetzung bitte bei Ilja melden :)',
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
                      controller: _passwordController, // TextEditingController
                    ),
                  ],
                ),

                FButton(
                  onPress: () {},
                  // onPress: () => setState(() => _count++),
                  suffix: const Icon(FIcons.lock),
                  child: const Text('Anmelden'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
