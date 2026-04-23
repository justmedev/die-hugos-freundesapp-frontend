import "package:flutter/widgets.dart";

extension DarkMode on BuildContext {
  bool get isDarkModeEnabled {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}