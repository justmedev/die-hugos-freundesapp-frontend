import "package:flutter/widgets.dart";
import "package:forui/forui.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);

    if (nav.canPop()) {
      return FScaffold(
        header: FHeader.nested(
          title: const Text("Die Hugos"),
          prefixes: [
            FHeaderAction.back(
              onPress: Get.back,
            ),
          ],
        ),
        child: SafeArea(top: false, child: child),
      );
    }

    return FScaffold(
      header: const FHeader(title: Text("Die Hugos")),
      child: SafeArea(top: false, child: child),
    );
  }
}
