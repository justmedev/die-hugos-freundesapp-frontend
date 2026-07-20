import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_user_settlement_summary.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cmds/cashpool_settlement_create_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_settlement_repo.dart";
import "package:get/get.dart";

class CashpoolSettlementService extends GetxService {
  CashpoolSettlementService(this._repo);

  final CashpoolSettlementRepo _repo;

  /// Get all suggested settlements required to even out a cashpool.
  Future<Iterable<CashpoolSuggestedSettlement>>
  getSuggestedSettlementsByCashpoolId(
    int cashpoolId,
  ) async {
    try {
      return await _repo.getSettlementsByCashpoolId(cashpoolId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CashpoolUserSettlementSummary> getUserSettlementSummary(
    int cashpoolId,
  ) async {
    try {
      return await _repo.getUserSettlementSummary(cashpoolId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CashpoolSettlement> create(CashpoolSettlementCreateCmd cmd) {
    return _repo.create(cmd);
  }

  Future<Iterable<CashpoolSettlement>> getAllByCashpoolId(int cashpoolId) {
    return _repo.getAllByCashpoolId(cashpoolId);
  }
}
