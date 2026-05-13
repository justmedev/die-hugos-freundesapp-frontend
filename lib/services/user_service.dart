import "package:diehugosapp/data/models/user/cmds/user_update_cmd.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:diehugosapp/data/repositories/user_repo.dart";
import "package:get/get.dart";

class UserService extends GetxService {
  UserService(this.repo);

  final UserRepo repo;

  /// Update the currently logged in user
  Future<User> update(UserUpdateCmd cmd) async {
    try {
      return await repo.update(cmd);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
