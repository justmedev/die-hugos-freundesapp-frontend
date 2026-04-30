import "package:diehugosapp/presentation/screens/cashpool/detail/cashpool_detail_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/cashpool_detail_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/cashpool_detail_settle_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/cashpool_detail_settle_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/cashpool_overview_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/cashpool_overview_screen.dart";
import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/presentation/screens/home/home_screen.dart";
import "package:diehugosapp/presentation/screens/login/login_controller.dart";
import "package:diehugosapp/presentation/screens/login/login_screen.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:diehugosapp/services/dialog_service.dart";
import "package:get/get.dart";

List<GetPage<dynamic>> routeBindings() => [
  GetPage(
    name: "/",
    page: () => const HomeScreen(),
    binding: BindingsBuilder<dynamic>(
      () => Get.lazyPut(
        () => HomeController(
          authService: Get.find<AuthService>(),
        ),
      ),
    ),
  ),
  GetPage(
    name: "/login",
    page: LoginScreen.new,
    binding: BindingsBuilder<dynamic>(
      () => Get.lazyPut(
        () => LoginController(
          authService: Get.find<AuthService>(),
        ),
      ),
    ),
  ),
  GetPage(
    name: "/cashpools/",
    page: () => const CashpoolOverviewScreen(),
    binding: BindingsBuilder<dynamic>(
      () => Get.lazyPut(
        () => CashpoolOverviewController(
          cashpoolService: Get.find<CashpoolService>(),
        ),
      ),
    ),
  ),
  GetPage(
    name: "/cashpools/details/settle/",
    page: () => const CashpoolDetailSettleScreen(),
    binding: BindingsBuilder<dynamic>(
      () => Get.lazyPut(CashpoolDetailSettleController.new),
    ),
  ),
  GetPage(
    name: "/cashpools/details/",
    page: () => const CashpoolDetailScreen(),
    binding: BindingsBuilder<dynamic>(
      () {
        Get.lazyPut(
          () => CashpoolDetailController(
            cashpoolTransactionService: Get.find<CashpoolTransactionService>(),
            cashpoolService: Get.find<CashpoolService>(),
            dialogService: Get.find<DialogService>(),
          ),
        );
      },
    ),
  ),
];
