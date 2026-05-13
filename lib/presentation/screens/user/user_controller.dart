import "package:diehugosapp/presentation/screens/user/edit_sheet/user_edit_controller.dart";
import "package:diehugosapp/presentation/screens/user/edit_sheet/user_edit_sheet.dart";
import "package:diehugosapp/presentation/screens/user/user_field.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:diehugosapp/services/user_service.dart";
import "package:flutter/cupertino.dart";
import "package:get/get.dart";

class UserController extends GetxController {
  UserController({required this.authService});

  late final AuthService authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    if (!Get.find<AuthService>().isAuthenticated) {
      await Get.offNamed<void>("/login");
    }
  }

  Future<void> handleTileEditPress(UserField field, Object initial) async {
    Get.lazyPut(
      () => UserEditController(
        authService: authService,
        userService: Get.find<UserService>(),
        fieldType: field,
        initialValue: initial,
      ),
    );
    await Get.bottomSheet<void>(
      const UserEditSheet(),
      settings: RouteSettings(arguments: Get.arguments),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );
  }

  Future<void> logout() async {
    await authService.logout();
    await Get.offNamed<void>("/login");
  }
}
