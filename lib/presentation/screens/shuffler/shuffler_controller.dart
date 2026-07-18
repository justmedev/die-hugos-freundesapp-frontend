import "dart:math";

import "package:diehugosapp/services/toaster_service.dart";
import "package:flutter/widgets.dart";
import "package:fortune_wheel/fortune_wheel.dart";
import "package:forui/assets.dart";
import "package:get/get.dart";

class ShufflerController extends GetxController {
  ShufflerController();

  static const respinText = "respin!";
  final GlobalKey<FortuneWheelState> wheelKey = GlobalKey<FortuneWheelState>();
  final Rx<TextEditingValue> newEntry = TextEditingValue.empty.obs;
  RxList<String> users = RxList([
    "annika",
    "ayse",
    "caro",
    "chris",
    "mona",
    "jakob",
    "ilja",
    "vera",
    "pascal",
    "angi",
    "marie",
    "niko",
    "thomas",
  ]);
  late RxSet<String> selectedUsers = RxSet(users.toSet());
  RxBool isSelectingUsers = true.obs;
  RxnString winner = RxnString();

  void handleAddEntryPressed() {
    if (users.contains(newEntry.value.text) ||
        newEntry.value.text == respinText) {
      Get.find<ToastService>().show(
        title: "Den Eintrag gibt's schon!",
        icon: const Icon(FIcons.triangleAlert),
      );
      return;
    }

    users.add(newEntry.value.text);
  }

  Future<void> handleShufflePressed() async {
    isSelectingUsers.value = false;
    selectedUsers.remove(respinText);
    if (selectedUsers.length.isEven) selectedUsers.add(respinText);
    final wonIndex = Random().nextInt(selectedUsers.length);

    await WidgetsBinding.instance.endOfFrame;

    print("Spinning to index $wonIndex");
    winner.value = null;
    await wheelKey.currentState!.spinToIndex(
      wonIndex,
      fullRotations: 3,
      allowInterrupt: true,
      maintainDirection: true,
      duration: const Duration(seconds: 3),
    );
    winner.value = selectedUsers.elementAt(
      wonIndex,
    );
    if (winner.value == respinText) {
      await Future<void>.delayed(
        const Duration(seconds: 2),
      ).then((_) async => handleShufflePressed());
    }
  }
}
