import 'package:diehugosapp/components/scaffold_with_navbar.dart';
import 'package:diehugosapp/screens/home/home_screen.dart';
import 'package:diehugosapp/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum RouterDestinations {
  home(url: '/'),
  login(url: '/login');

  final String url;

  const RouterDestinations({required this.url});
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterDestinations.login.url,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavbar(child: child);
      },
      routes: [
        GoRoute(
          path: RouterDestinations.login.url,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: RouterDestinations.home.url,
          builder: (context, state) => HomeScreen(),
        ),
      ],
    ),
  ],
);
