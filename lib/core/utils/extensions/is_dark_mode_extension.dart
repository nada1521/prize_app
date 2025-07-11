import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
