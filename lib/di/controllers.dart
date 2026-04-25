part of "di.dart";

void _setupControllers() {
  Get
    ..lazyPut(() => LoginController(authService: Get.find<AuthService>()))
    ..lazyPut(() => HomeController(authService: Get.find<AuthService>()))
    ..lazyPut(
      () => CashpoolCreateController(
        cashpoolService: Get.find<CashpoolService>(),
      ),
    )
    ..lazyPut(
      () => CashpoolOverviewController(
        cashpoolService: Get.find<CashpoolService>(),
      ),
    );
}
