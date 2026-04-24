import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:diehugosapp/di/dio.dart";
import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/presentation/screens/login/login_controller.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

Future<void> initGlobalProviders() async {
  Get
    ..lazyPut<Dio>(getNewSetupDio)
    ..lazyPut<AuthRepo>(AuthRepoImpl.new)
    ..lazyPut(AuthService.new)
    ..lazyPut(() => LoginController(authService: Get.find<AuthService>()))
    ..lazyPut(() => HomeController(authService: Get.find<AuthService>()))
    ..lazyPut(ToastService.new);

  await Get.putAsync(SharedPreferences.getInstance);
}
