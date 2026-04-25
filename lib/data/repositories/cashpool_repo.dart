import "package:diehugosapp/data/models/cashpool/cashpool.dart";
import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:dio/dio.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_instance/src/extension_instance.dart";

abstract class CashpoolRepo {
  Future<Cashpool> create(CashpoolCreateCmd cmd);
  // TODO: delete, update, find, get
}

class CashpoolRepoImpl implements CashpoolRepo {
  @override
  Future<Cashpool> create(CashpoolCreateCmd cmd) async {
    final dio = Get.find<Dio>();
    final res = await dio.post("/cashpools", data: cmd.toJson());
    if (res.data == null) throw Exception("res.data shall not be null!");
    print(res.data);
    return Cashpool.fromJson(res.data! as Map<String, Object?>);
  }
}
