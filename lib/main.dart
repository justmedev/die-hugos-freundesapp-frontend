import 'package:diehugosapp/buildcontext.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    /// To create a custom theme:
    /// ```shell
    /// dart forui theme create [theme template].
    /// ```
    final theme = context.isDarkModeEnabled
        ? FThemes.zinc.dark
        : FThemes.zinc.light;

    return MaterialApp(
      supportedLocales: [/*Locale('en'), */ Locale('de', 'AT')],
      // TODO: add your application's localizations delegates.
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      builder: (_, child) => FTheme(data: theme, child: child!),
      theme: theme.toApproximateMaterialTheme(),
      // You can also replace FScaffold with Material Scaffold.
      home: const FScaffold(child: Example()),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Center(
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
  );
}
