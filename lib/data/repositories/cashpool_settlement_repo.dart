import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_suggested_settlement.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_user_settlement_summary.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cmds/cashpool_settlement_create_cmd.dart";
import "package:dio/dio.dart";

abstract class CashpoolSettlementRepo {
  Future<Iterable<CashpoolSuggestedSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  );

  Future<CashpoolUserSettlementSummary> getUserSettlementSummary(
    int cashpoolId,
  );

  Future<CashpoolSettlement> create(CashpoolSettlementCreateCmd cmd);

  Future<Iterable<CashpoolSettlement>> getAllByCashpoolId(int cashpoolId);
}

class CashpoolSettlementRepoImpl implements CashpoolSettlementRepo {
  CashpoolSettlementRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<Iterable<CashpoolSuggestedSettlement>> getSettlementsByCashpoolId(
    int cashpoolId,
  ) async {
    final res = await dio.get<List<dynamic>>(
      "/cashpools/$cashpoolId/settle/suggest",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) =>
          CashpoolSuggestedSettlement.fromJson(item as Map<String, Object?>),
    );
  }

  @override
  Future<CashpoolUserSettlementSummary> getUserSettlementSummary(
    int cashpoolId,
  ) async {
    final res = await dio.get<Map<String, Object?>>(
      "/cashpools/$cashpoolId/settle/suggest/me",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolUserSettlementSummary.fromJson(res.data!);
  }

  @override
  Future<CashpoolSettlement> create(CashpoolSettlementCreateCmd cmd) async {
    final res = await dio.post<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/settle",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolSettlement.fromJson(res.data!);
  }

  @override
  Future<Iterable<CashpoolSettlement>> getAllByCashpoolId(
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
