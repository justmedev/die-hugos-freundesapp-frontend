part of "di.dart";

void _setupControllers() {
  Get.put(HomeController(authService: Get.find<AuthService>()));
  // All other controllers are set up in route_bindings
}
