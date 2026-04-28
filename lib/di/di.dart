library;

import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:diehugosapp/data/repositories/cashpool_repo.dart";
import "package:diehugosapp/di/dio.dart";
import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

part "controllers.dart";
part "externals.dart";
part "repos.dart";
part "services.dart";

Future<void> setupDI() async {
  await _setupExternals();
  _setupServices();
  _setupRepos();
  _setupControllers();
}
