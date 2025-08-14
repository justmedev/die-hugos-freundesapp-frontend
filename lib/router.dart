import 'package:diehugosapp/screens/home/home_screen.dart';
import 'package:diehugosapp/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

enum RouterDestinations {
  home(url: '/'),
  login(url: '/login');

  final String url;

  const RouterDestinations({required this.url});
}

final goRouter = GoRouter(
  initialLocation: RouterDestinations.login.url,
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
);
