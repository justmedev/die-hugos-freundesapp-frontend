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
    final res = await dio.post("/cashpools", data: cmd.toJson());
    if (res.data == null) throw Exception("res.data shall not be null!");
    print(res.data);
    return Cashpool.fromJson(res.data! as Map<String, Object?>);
  }

  @override
  Future<Iterable<Cashpool>> getAll() async {
    final res = await dio.get("/cashpools");
    if (res.data == null) throw Exception("res.data shall not be null!");
    return (res.data! as List<dynamic>).map(
      (item) => Cashpool.fromJson(item as Map<String, Object?>),
    );
  }

  @override
  Future<CashpoolDetailed> getDetailed(int id) async {
    final res = await dio.get("/cashpools/$id");
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolDetailed.fromJson(res.data! as Map<String, Object?>);
  }
}
