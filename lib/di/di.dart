library;

import "package:diehugosapp/core/network/dio.dart";
import "package:diehugosapp/data/managers/session_manager.dart";
import "package:diehugosapp/data/repositories/auth_repo.dart";
import "package:diehugosapp/data/repositories/cashpool_member_repo.dart";
import "package:diehugosapp/data/repositories/cashpool_repo.dart";
import "package:diehugosapp/data/repositories/cashpool_settlement_repo.dart";
import "package:diehugosapp/data/repositories/cashpool_transaction_repo.dart";
import "package:diehugosapp/data/repositories/user_repo.dart";
import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/cashpool_member_service.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:diehugosapp/services/dialog_service.dart";
import "package:diehugosapp/services/epc_qr_service.dart";
import "package:diehugosapp/services/toaster_service.dart";
import "package:diehugosapp/services/user_service.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";
import "package:shared_preferences/shared_preferences.dart";

part "controllers.dart";
part "externals.dart";
part "managers.dart";
part "repos.dart";
part "services.dart";

Future<void> setupDI() async {
  await _setupExternals();
  _setupManagers();
  _setupRepos();
  _setupServices();
  _setupControllers();
}
