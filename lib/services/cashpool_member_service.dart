import "package:diehugosapp/data/models/cashpool_member/cashpool_member.dart";
import "package:diehugosapp/data/models/cashpool_member/cmds/cashpool_member_create_cmd.dart";
import "package:diehugosapp/data/repositories/cashpool_member_repo.dart";
import "package:get/get.dart";

class CashpoolMemberService extends GetxService {
  CashpoolMemberService(this._repo);

  final CashpoolMemberRepo _repo;

  Future<CashpoolMember> create(
    int cashpoolId,
  ) async {
    try {
      return await _repo.create(
        CashpoolMemberCreateCmd(cashpoolId: cashpoolId),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
