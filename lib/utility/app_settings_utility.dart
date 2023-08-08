import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSettingsUtility {
  ThemeMode get getThemeMode {
    final box = Hive.box("settings");
    switch (box.get("darkmode")) {
      case "system":
        return ThemeMode.system;
      case false:
        return ThemeMode.light;
      case true:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void setThemeMode(ThemeMode themeMode) {
    final box = Hive.box("settings");
    switch (themeMode) {
      case ThemeMode.system:
        box.put("darkmode", "system");
        break;
      case ThemeMode.light:
        box.put("darkmode", false);
        break;
      case ThemeMode.dark:
        box.put("darkmode", true);
        break;
      default:
        box.put("darkmode", "system");
    }
  }
}
