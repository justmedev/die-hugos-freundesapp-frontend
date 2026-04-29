import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class DialogService extends GetxService {
  Future<void> show({
    required Widget Function(
      BuildContext context,
      FDialogStyle style,
      Animation<double> animation,
    )
    builder,
    bool dismissable = true,
  }) async {
    final context = Get.context;

    if (context != null) {
      await showFDialog<dynamic>(
        barrierDismissible: dismissable,
        context: context,
        builder: builder,
      );
    }
  }
}
