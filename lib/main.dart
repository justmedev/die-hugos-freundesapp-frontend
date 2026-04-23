import "package:diehugosapp/core/utils/buildcontext_extensions.dart";
import "package:diehugosapp/presentation/routes/router.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

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

    return MaterialApp.router(
      supportedLocales: const [/*Locale('en'), */ Locale("de", "AT")],
      // TODO: add your application's localizations delegates.
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      builder: (_, child) => FTheme(data: theme, child: child!),
      theme: theme.toApproximateMaterialTheme(),
      routerConfig: goRouter,
    );
  }
}
