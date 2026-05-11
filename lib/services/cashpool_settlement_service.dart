import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:diehugosapp/data/repositories/cashpool_settlement_repo.dart";
import "package:get/get.dart";

class CashpoolSettlementService extends GetxService {
  CashpoolSettlementService(this._repo);

  final CashpoolSettlementRepo _repo;

  /// Get all settlements required to even out a cashpool.
  Future<Iterable<CashpoolSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  ) async {
    try {
      return await _repo.getSettlementsByCashpoolId(cashpoolId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
