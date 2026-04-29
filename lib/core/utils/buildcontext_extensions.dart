import "package:flutter/widgets.dart";

extension DarkMode on BuildContext {
  bool get isDarkModeEnabled {
    final brightness = MediaQuery.platformBrightnessOf(this);
    return brightness == Brightness.dark;
  }
}
