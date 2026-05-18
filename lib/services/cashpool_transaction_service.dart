import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction_event.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_update_transaction_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_transaction_repo.dart";
import "package:get/get.dart";

class CashpoolTransactionService extends GetxService {
  CashpoolTransactionService(this.repo);

  final CashpoolTransactionRepo repo;

  /// Create a new [CashpoolTransaction]
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd) async {
    try {
      return await repo.create(cmd);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Create a new [CashpoolTransaction]
  Future<CashpoolTransaction> update(CashpoolTransactionUpdateCmd cmd) async {
    try {
      return await repo.update(cmd);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Get [CashpoolTransaction]s by cashpool
  Future<Iterable<CashpoolTransaction>> getByCashpool(int cashpoolId) async {
    try {
      return await repo.getAllByCashpoolId(cashpoolId);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Receive a stream of live [CashpoolTransactionEvent]s. You must close this
  /// stream to avoid memory leaks.
  /// This will also stream events that you yourself have triggered, you need to
  /// filter these out yourself.
  Future<Stream<CashpoolTransactionEvent>> listenToCashpoolTransactions(
    int cashpoolId,
  ) async => repo.listenToTransactionEvents(cashpoolId);
}
