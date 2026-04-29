import "package:diehugosapp/core/errors/not_a_cashpool_member.dart";
import "package:diehugosapp/data/models/cashpool/cashpool.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:dio/dio.dart";

abstract class CashpoolRepo {
  Future<Cashpool> create(CashpoolCreateCmd cmd);

  Future<Iterable<Cashpool>> getAll();

  Future<CashpoolDetailed> getDetailed(int id);
  // TODO: delete, update
}

class CashpoolRepoImpl implements CashpoolRepo {
  CashpoolRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<Cashpool> create(CashpoolCreateCmd cmd) async {
    final res = await dio.post<Map<String, Object?>>(
      "/cashpools",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return Cashpool.fromJson(res.data!);
  }

  @override
  Future<Iterable<Cashpool>> getAll() async {
    final res = await dio.get<List<dynamic>>("/cashpools");
    if (res.data == null) throw Exception("res.data shall not be null!");
    return res.data!.map(
      (item) => Cashpool.fromJson(item as Map<String, Object?>),
    );
  }

  @override
  Future<CashpoolDetailed> getDetailed(int id) async {
    try {
      final res = await dio.get<Map<String, Object?>>("/cashpools/$id");
      if (res.data == null) throw Exception("res.data shall not be null!");
      return CashpoolDetailed.fromJson(res.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw NotACashpoolMember();
      }
      rethrow;
    }
  }
}
