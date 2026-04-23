import "package:diehugosapp/presentation/screens/cashpool/cashpool_create_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/cashpool_detail_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/cashpool_overview_screen.dart";
import "package:diehugosapp/presentation/screens/home/home_screen.dart";
import "package:diehugosapp/presentation/screens/login/login_screen.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/widgets.dart";
import "package:go_router/go_router.dart";

enum RouterDestinations {
  home(url: "/"),
  login(url: "/login"),
  cashpoolOverview(url: "/cashpoolOverview"),
  cashpoolDetail(url: "/cashpoolDetail"),
  cashpoolCreate(url: "/cashpoolCreate");

  final String url;

  const RouterDestinations({required this.url});
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "root",
);
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "shell",
);

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterDestinations.login.url,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavbar(child: child);
      },
      routes: [
        GoRoute(
          path: "/login",
          name: "Anmelden",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/",
          name: "Die Hugos",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: "cashpools",
              name: "Gruppenkassen",
              builder: (context, state) => const CashpoolOverviewScreen(),
              routes: [
                GoRoute(
                  path: "create",
                  name: "Gruppenkassa erstellen",
                  builder: (context, state) => const CashpoolCreateScreen(),
                ),
                GoRoute(
                  path: "details",
                  name: "Gruppenkassa",
                  builder: (context, state) => const CashpoolDetailScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
