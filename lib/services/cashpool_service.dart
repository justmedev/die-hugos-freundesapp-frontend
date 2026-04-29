import "package:diehugosapp/data/models/cashpool/cashpool.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_repo.dart";
import "package:get/get.dart";

class CashpoolService extends GetxService {
  CashpoolService(this.repo);

  final CashpoolRepo repo;

  final RxList<Cashpool> cashpools = RxList.empty();

  /// Create a new [Cashpool] and add it to [cashpools]
  Future<void> create(CashpoolCreateCmd cmd) async {
    try {
      cashpools.add(await repo.create(cmd));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Clear the [cashpools] list and repopulate it with fetched content.
  Future<void> getAll() async {
    try {
      cashpools
        ..clear()
        ..addAll(await repo.getAll());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CashpoolDetailed> getDetailed(int id) async {
    return repo.getDetailed(id);
  }
}
