import "package:diehugosapp/presentation/screens/cashpool/detail/join_dialog/cashpool_detail_join_controller.dart";
import "package:diehugosapp/presentation/widgets/async_button.dart";
import "package:flutter/widgets.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolDetailJoinDialog extends GetView<CashpoolDetailJoinController> {
  const CashpoolDetailJoinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: const Text("Kein Mitglied"),
      body: const Text(
        "Du bist noch kein Mitglied dieser Gruppenkassa. Wenn du beitrittst, musst du auch an den Zahlungen teilnehmen. Willst du beitreten?",
      ),
      actions: [
        FButton(
          variant: .outline,
          onPress: () => Get.close(2),
          child: const Text("Zurück zur Übersicht"),
        ),
        AsyncButton(
          onPress: controller.handleJoinPress,
          child: const Text("Beitreten"),
        ),
      ],
    );
  }
}
