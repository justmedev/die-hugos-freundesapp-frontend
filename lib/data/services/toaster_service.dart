import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class ToastService extends GetxService {
  void show({
    required String title,
    String? description,
    Icon icon = const Icon(FIcons.info),
  }) {
    final context = Get.context;

    if (context != null) {
      showFToast(
        context: context,
        title: Text(title),
        description: description != null ? Text(description) : null,
        alignment: FToastAlignment.topCenter,
        swipeToDismiss: [AxisDirection.up],
        icon: icon,
      );
    }
  }
}
