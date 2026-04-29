import "package:diehugosapp/core/utils/buildcontext_extensions.dart";
import "package:diehugosapp/di/di.dart";
import "package:diehugosapp/presentation/routes/route_bindings.dart";
import "package:diehugosapp/presentation/screens/home/home_screen.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDI();
  await Get.find<AuthService>().authLocally();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    /// To cmds a custom theme:
    /// ```shell
    /// dart forui theme cmds [theme template].
    /// ```
    final theme = context.isDarkModeEnabled
        ? FThemes.zinc.dark
        : FThemes.zinc.light;

    final platformSpecificTheme =
        const <TargetPlatform>{
          .android,
          .iOS,
          .fuchsia,
        }.contains(defaultTargetPlatform)
        ? theme.touch
        : theme.desktop;

    return GetMaterialApp(
      supportedLocales: const [Locale("de", "AT")],
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      builder: (_, child) => FTheme(
        data: platformSpecificTheme,
        child: FToaster(child: child!),
      ),
      theme: platformSpecificTheme.toApproximateMaterialTheme(),
      getPages: routeBindings(),
      home: const HomeScreen(),
    );
  }
}
