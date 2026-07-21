import "package:diehugosapp/core/network/interceptors/auth_interceptor.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:dio/dio.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

Dio getNewSetupDio() {
  final dio = Dio(BaseOptions(baseUrl: dotenv.get("API_BASE_URL")));
  dio.interceptors.addAll([
    AuthInterceptor(),
    InterceptorsWrapper(
      onError: (err, handler) {
        if (err.type == DioExceptionType.connectionError ||
            err.type == DioExceptionType.connectionTimeout) {
          Get.find<ToastService>().show(
            title: "Es konnte keine Verbindung zu diehugos hergestellt werden!",
            description: "Hast du Internet?",
            icon: const Icon(FIcons.triangleAlert),
          );
        }

        return handler.next(err);
      },
    ),
  ]);
  return dio;
}
