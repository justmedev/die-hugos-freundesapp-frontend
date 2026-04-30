import "package:flutter/widgets.dart";
import "package:forui/forui.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({
    required this.child,
    this.suffixes = const [],
    super.key,
  });

  final Widget child;
  final List<Widget> suffixes;

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);

    return FScaffold(
      header: nav.canPop()
          ? FHeader.nested(
              title: const Text("Die Hugos"),
              prefixes: [
                FHeaderAction.back(
                  onPress: Get.back<void>,
                ),
              ],
              suffixes: suffixes,
            )
          : FHeader(
              title: const Text("Die Hugos"),
              suffixes: suffixes,
            ),
      child: SafeArea(top: false, child: child),
    );
  }
}
