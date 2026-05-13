import "package:diehugosapp/core/errors/malformed_iban.dart";
import "package:diehugosapp/data/models/user/cmds/user_update_cmd.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:diehugosapp/data/repositories/user_repo.dart";
import "package:diehugosapp/services/iban_service.dart";
import "package:get/get.dart";

class UserService extends GetxService {
  UserService(this.repo, this.ibanService);

  final UserRepo repo;
  final IBANService ibanService;

  /// Update the currently logged in user
  Future<User> update(UserUpdateCmd cmd) async {
    if (cmd.accountIBAN != null &&
        !ibanService.validateIBAN(cmd.accountIBAN!)) {
      throw MalformedIBAN();
    }
    try {
      return await repo.update(cmd);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
