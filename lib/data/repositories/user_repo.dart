import "package:diehugosapp/data/models/user/cmds/user_update_cmd.dart";
import "package:diehugosapp/data/models/user/user.dart";
import "package:dio/dio.dart";

abstract class UserRepo {
  Future<User> update(UserUpdateCmd cmd);
  // TODO: delete, update
}

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<User> update(UserUpdateCmd cmd) async {
    final res = await dio.put<Map<String, Object?>>(
      "/users",
      data: cmd.toRequest().toJson(),
    );
    if (res.data == null) throw Exception("res.data shall not be null!");
    return User.fromJson(res.data!);
  }
}
