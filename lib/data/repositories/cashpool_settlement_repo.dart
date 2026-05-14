import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:dio/dio.dart";

abstract class CashpoolSettlementRepo {
  Future<Iterable<CashpoolSuggestedSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  );
  // TODO: create
}

class CashpoolSettlementRepoImpl implements CashpoolSettlementRepo {
  CashpoolSettlementRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<Iterable<CashpoolSuggestedSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get<List<dynamic>>(
      "/cashpools/$cashpoolId/settle",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) =>
          CashpoolSuggestedSettlement.fromJson(item as Map<String, Object?>),
    );
  }
}
