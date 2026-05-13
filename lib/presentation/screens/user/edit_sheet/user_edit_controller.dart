import "package:diehugosapp/data/models/user/cmds/user_update_cmd.dart";
import "package:diehugosapp/data/repositories/user_repo.dart";
import "package:diehugosapp/presentation/screens/user/user_field.dart";
import "package:diehugosapp/services/auth_service.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

class UserEditController extends GetxController {
  UserEditController({
    required this.authService,
    required this.userRepo,
    required this.initialValue,
    required this.fieldType,
  });

  final AuthService authService;
  final UserRepo userRepo;
  final Object initialValue;
  final UserField fieldType;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<DateTime> dateField = Rxn(DateTime(2007));
  Rx<TextEditingValue> field = TextEditingValue.empty.obs;
  Rx<TextEditingValue> description = TextEditingValue.empty.obs;

  @override
  void onInit() {
    super.onInit();
    if (fieldType.type == EditType.date) {
      dateField.value = initialValue as DateTime;
    } else {
      field.value = TextEditingValue(text: initialValue as String);
    }
  }

  Future<void> save() async {
    final user = authService.user;
    if (user == null) throw Exception("user should be defined at this point!");
    var email = user!.email;
    var firstName = user!.firstName;
    var lastName = user!.lastName;
    var accountHolderName = user!.accountHolderName;
    var accountIBAN = user!.accountIBAN;
    var birthdate = user!.birthdate;

    switch (fieldType) {
      case UserField.fullName:
        final fullName = field.value.text.split(" ");
        firstName = fullName[0];
        if (fullName.length > 1) {
          lastName = fullName.getRange(1, fullName.length - 1).join(" ");
        } else {
          lastName = "";
        }
      case UserField.email:
        email = field.value.text;
      case UserField.iban:
        accountIBAN = field.value.text;
      case UserField.accountHolder:
        accountHolderName = field.value.text;
      case UserField.birthdate:
        if (dateField.value == null) return;
        birthdate = dateField.value!;
    }

    authService.replaceUser(
      await userRepo.update(
        UserUpdateCmd(
          email: email,
          firstName: firstName,
          lastName: lastName,
          accountHolderName: accountHolderName,
          accountIBAN: accountIBAN,
          birthdate: birthdate,
        ),
      ),
    );
    Get.back<void>();
  }
}
