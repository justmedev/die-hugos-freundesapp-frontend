import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_update_transaction_cmd.dart";
import "package:dio/dio.dart";

abstract class CashpoolTransactionRepo {
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd);

  Future<CashpoolTransaction> update(CashpoolTransactionUpdateCmd cmd);

  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(int cashpoolId);
  // TODO: delete
}

class CashpoolTransactionRepoImpl implements CashpoolTransactionRepo {
  CashpoolTransactionRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd) async {
    final res = await dio.post<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/transactions",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolTransaction.fromJson(res.data!);
  }

  @override
  Future<CashpoolTransaction> update(CashpoolTransactionUpdateCmd cmd) async {
    final res = await dio.put<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/transactions/${cmd.transactionId}",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolTransaction.fromJson(res.data!);
  }

  @override
  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get<List<dynamic>>(
      "/cashpools/$cashpoolId/transactions",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) => CashpoolTransaction.fromJson(item as Map<String, Object?>),
    );
  }
}
