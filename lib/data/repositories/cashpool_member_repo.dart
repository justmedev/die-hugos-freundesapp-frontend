import "package:diehugosapp/data/models/cashpool_member/cashpool_member.dart";
import "package:diehugosapp/data/models/cashpool_member/cmds/cashpool_member_create_cmd.dart";
import "package:dio/dio.dart";

abstract class CashpoolMemberRepo {
  Future<CashpoolMember> create(CashpoolMemberCreateCmd cmd);
  // TODO: create
}

class CashpoolMemberRepoImpl implements CashpoolMemberRepo {
  CashpoolMemberRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<CashpoolMember> create(CashpoolMemberCreateCmd cmd) async {
    final res = await dio.post<Map<String, Object?>>(
      "/cashpools/${cmd.cashpoolId}/members",
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return CashpoolMember.fromJson(res.data!);
  }
}
