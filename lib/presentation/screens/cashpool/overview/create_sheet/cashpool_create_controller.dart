import "package:diehugosapp/data/models/cashpool/cmds/cashpool_create_cmd.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

class CashpoolCreateController extends GetxController {
  CashpoolCreateController({required this.cashpoolService});

  late final CashpoolService cashpoolService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingValue> title = TextEditingValue.empty.obs;
  Rx<TextEditingValue> description = TextEditingValue.empty.obs;

  Future<void> handleCreatePressed() async {
    if (!formKey.currentState!.validate()) {
      return; // Form is invalid.
    }

    await cashpoolService.create(
      CashpoolCreateCmd(
        title: title.value.text,
        description: description.value.text,
      ),
    );

    Get.back<void>();
  }
}
