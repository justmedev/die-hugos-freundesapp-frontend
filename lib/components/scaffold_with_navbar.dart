import 'package:diehugosapp/router.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header:
          GoRouterState.of(context).matchedLocation ==
              RouterDestinations.login.url
          ? null
          : FHeader(title: Text('Die Hugos')),
      child: SafeArea(top: false, child: child),
    );
  }
}
