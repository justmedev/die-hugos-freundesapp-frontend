import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class Styles {
  static final FThemeData _theme = FThemeBuildContext(Get.context!).theme;

  static final TextStyle titleStyle = _theme.typography.xl2.copyWith(
    fontWeight: .w600,
    color: _theme.colors.foreground,
    height: 1.5,
  );
}
