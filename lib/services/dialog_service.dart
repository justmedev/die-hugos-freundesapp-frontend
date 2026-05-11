import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class DialogService extends GetxService {
  Future<T?> show<T>({
    required Widget Function(
      BuildContext context,
      FDialogStyle style,
      Animation<double> animation,
    )
    builder,
    bool dismissable = true,
    RouteSettings? routeSettings,
  }) async {
    final context = Get.context;

    if (context != null) {
      return showFDialog<T>(
        barrierDismissible: dismissable,
        context: context,
        routeSettings: routeSettings,
        builder: builder,
      );
    }
    return null;
  }
}
