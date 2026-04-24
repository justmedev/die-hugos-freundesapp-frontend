import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:dio/dio.dart";
import "package:flutter/cupertino.dart";
import "package:forui/assets.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";

Dio getNewSetupDio() {
  final dio = Dio(BaseOptions(baseUrl: "http://localhost:8000"));
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (opts, handler) {
        final authService = Get.find<AuthService>();
        if (authService.isAuthenticated && authService.token != null) {
          opts.headers["Authorization"] = "Bearer ${authService.token}";
        }
        return handler.next(opts);
      },
      onError: (err, handler) {
        if (err.type == DioExceptionType.connectionError ||
            err.type == DioExceptionType.connectionTimeout) {
          Get.find<ToastService>().show(
            title: "Es konnte keine Verbindung zu diehugos hergestellt werden!",
            description: "Hast du Internet?",
            icon: const Icon(FIcons.triangleAlert),
          );
        }

        throw err;
      },
    ),
  );
  return dio;
}
