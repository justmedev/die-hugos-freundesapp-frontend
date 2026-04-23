import 'package:diehugosapp/router.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var routeName = GoRouterState.of(context).topRoute?.name;

    final canPop = shellNavigatorKey.currentState?.canPop() ?? false;
    print("Can pop? $canPop");
    Widget? header;
    if (routeName != null) {
      if (!(shellNavigatorKey.currentState?.canPop() ?? false)) {
        header = FHeader(title: Text(routeName));
      } else {
        header = FHeader.nested(
          title: Text(routeName),
          prefixes: [FHeaderAction.back(onPress: () {
            context.pop();
          })],
        );
      }
    }

    return FScaffold(
      header: header,
      child: SafeArea(top: false, child: child),
    );
  }
}
