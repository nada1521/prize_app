import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/helper/cache_helper.dart';
import 'package:flutter/material.dart' show ThemeMode;

class ThemeRepo {
  const ThemeRepo();

  ThemeMode getAppTheme() {
    final isDarkMode = CacheHelper.getBool(AppStrings.isDarkMode);
    switch (isDarkMode) {
      case true:
        return ThemeMode.dark;
      case false:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> changeAppTheme(ThemeMode themeMode) async {
    switch (themeMode) {
      case ThemeMode.dark:
        await CacheHelper.setData(AppStrings.isDarkMode, true);
        break;
      case ThemeMode.light:
        await CacheHelper.setData(AppStrings.isDarkMode, false);
        break;
      default:
        await CacheHelper.remove(AppStrings.isDarkMode);
    }
  }
}
