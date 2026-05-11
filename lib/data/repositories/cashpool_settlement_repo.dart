import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:dio/dio.dart";

abstract class CashpoolSettlementRepo {
  Future<Iterable<CashpoolSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  );
  // TODO: create
}

class CashpoolSettlementRepoImpl implements CashpoolSettlementRepo {
  CashpoolSettlementRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<Iterable<CashpoolSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get<List<dynamic>>(
      "/cashpools/$cashpoolId/settle",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) => CashpoolSettlement.fromJson(item as Map<String, Object?>),
    );
  }
}
