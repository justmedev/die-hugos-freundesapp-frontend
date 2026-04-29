import "package:diehugosapp/data/models/cashpool/cashpool.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_repo.dart";
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
      rethrow;
    }
  }

  /// Clear the [cashpools] list and repopulate it with fetched content.
  Future<void> getAll() async {
    final cashpoolRepo = Get.find<CashpoolRepo>();
    try {
      cashpools
        ..clear()
        ..addAll(await cashpoolRepo.getAll());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CashpoolDetailed> getDetailed(int id) async {
    final cashpoolRepo = Get.find<CashpoolRepo>();
    return cashpoolRepo.getDetailed(id);
  }
}
