import 'package:diehugosapp/components/scaffold_with_navbar.dart';
import 'package:diehugosapp/screens/cashpool/cashpool_create_screen.dart';
import 'package:diehugosapp/screens/cashpool/cashpool_detail_screen.dart';
import 'package:diehugosapp/screens/cashpool/cashpool_overview_screen.dart';
import 'package:diehugosapp/screens/home/home_screen.dart';
import 'package:diehugosapp/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum RouterDestinations {
  home(url: '/'),
  login(url: '/login'),
  cashpoolOverview(url: '/cashpoolOverview'),
  cashpoolDetail(url: '/cashpoolDetail'),
  cashpoolCreate(url: '/cashpoolCreate');

  final String url;

  const RouterDestinations({required this.url});
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterDestinations.login.url,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavbar(child: child);
      },
      routes: [
        GoRoute(
          path: '/login',
          name: "Anmelden",
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/',
          name: "Die Hugos",
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'cashpools',
              name: "Gruppenkassen",
              builder: (context, state) => CashpoolOverviewScreen(),
              routes: [
                GoRoute(
                  path: 'create',
                  name: "Gruppenkassa erstellen",
                  builder: (context, state) => CashpoolCreateScreen(),
                ),
                GoRoute(
                  path: 'details',
                  name: "Gruppenkassa",
                  builder: (context, state) => CashpoolDetailScreen(),
                ),
              ]
            ),
          ]
        ),
      ],
    ),
  ],
);
