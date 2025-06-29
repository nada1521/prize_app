import 'package:flutter/material.dart' show ThemeMode;

extension ThemeModeX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;

  bool get isLight => this == ThemeMode.light;

  bool get isSystem => this == ThemeMode.system;
}
