import "package:diehugosapp/core/errors/not_a_cashpool_member.dart";
import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/dialog_service.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolDetailController extends GetxController {
  CashpoolDetailController({
    required this.cashpoolService,
    required this.dialogService,
  });

  late final CashpoolService cashpoolService;
  late final DialogService dialogService;
  final Rx<UiState> state = UiState.loading().obs;
  final Rxn<CashpoolDetailed> cashpool = Rxn();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCashpoolDetails();
  }

  Future<void> fetchCashpoolDetails() async {
    state.value = UiState.loading();
    try {
      final id = (Get.arguments as Map<String, int>)["id"];

      cashpool.value = await cashpoolService.getDetailed(id!);
      state.value = UiState.success();
    } on NotACashpoolMember {
      await dialogService.show(
        dismissable: false,
        builder: (context, style, animation) => FDialog(
          style: style,
          animation: animation,
          title: const Text("Kein Mitglied"),
          body: const Text(
            "Du bist noch nicht Mitglied dieser Gruppenkassa. Wenn du beitrittst, musst du auch an den Zahlungen teilnehmen. Willst du beitreten?",
          ),
          actions: [
            FButton(
              variant: .outline,
              onPress: () => Get.close(2),
              child: const Text("Zurück zur Übersicht"),
            ),
            FButton(
              onPress: () {
                // TODO: Join
                Get.back(); // Close dialog
              },
              child: const Text("Beitreten"),
            ),
          ],
        ),
      );
    } catch (e) {
      cashpool.value = null;
      state.value = UiState.error();
      rethrow;
    }
  }
}
