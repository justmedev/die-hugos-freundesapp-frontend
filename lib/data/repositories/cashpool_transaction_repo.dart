import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cmds/cashpool_create_transaction_cmd.dart";
import "package:dio/dio.dart";

abstract class CashpoolTransactionRepo {
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd);

  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(int cashpoolId);
  // TODO: delete, update
}

class CashpoolTransactionRepoImpl implements CashpoolTransactionRepo {
  CashpoolTransactionRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<CashpoolTransaction> create(CashpoolTransactionCreateCmd cmd) async {
    final res = await dio.post(
      "/cashpools/${cmd.cashpoolId}/transactions",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolTransaction.fromJson(res.data! as Map<String, Object?>);
  }

  @override
  Future<Iterable<CashpoolTransaction>> getAllByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get("/cashpools/$cashpoolId/transactions");
    if (res.data == null) throw Exception("res.data shall not be null!");
    return (res.data! as List<dynamic>).map(
      (item) => CashpoolTransaction.fromJson(item as Map<String, Object?>),
    );
  }
}
