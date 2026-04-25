import "package:diehugosapp/data/models/cashpool/cashpool.dart";
import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_repo.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:dio/dio.dart";
import "package:get/get.dart";

class CashpoolService extends GetxService {
  final RxList<Cashpool> cashpools = RxList.empty();

  /// Create a new [Cashpool] and add it to [cashpools]
  Future<void> create(CashpoolCreateCmd cmd) async {
    final cashpoolRepo = Get.find<CashpoolRepo>();
    try {
      cashpools.add(await cashpoolRepo.create(cmd));
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          throw WrongCredentials();
        }
      }
      rethrow;
    }
  }

  /// Clear the [cashpools] list and repopulate it with fetched content.
  Future<void> fetch() async {
    final cashpoolRepo = Get.find<CashpoolRepo>();
    try {
      cashpools
        ..clear()
        ..addAll(await cashpoolRepo.fetch());
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          throw WrongCredentials();
        }
      }
      rethrow;
    }
  }
}
