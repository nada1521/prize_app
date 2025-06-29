import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

extension ColorX on BuildContext {
  bool get _isLightTheme => Theme.of(this).brightness == Brightness.light;

  /// Returns [light] color in **light** mode, [dark] in **dark** mode.
  Color getColorByBrightness(Color light, Color dark) =>
      _isLightTheme ? light : dark;

  /// If **Light Mode**, returns [primary], else returns [white].
  Color get colorPrimary =>
      getColorByBrightness(AppColors.primary, AppColors.primaryDarkMode);

  /// If **Light Mode**, returns [primaryDark20], else returns [grey].
  Color get colorPrimaryDarkGrey =>
      _isLightTheme ? AppColors.primaryDark20 : AppColors.grey;

  Color get colorOnPrimary => AppColors.onPrimaryColor;

  /// If **Light Mode**, returns [primary], else returns [white].
  Color get colorPrimaryWhite =>
      _isLightTheme ? AppColors.primary : AppColors.white;

  Color get colorWhitePrimary =>
      _isLightTheme ? AppColors.white : AppColors.primary;

  Color get colorPrimaryLight =>
      _isLightTheme ? AppColors.primaryLight : AppColors.primaryLightA20;

  /// If **Light Mode**, returns [White], else returns [Null].
  Color? get colorWhiteOrNull => _isLightTheme ? AppColors.white : null;

  Color get colorGreyLight =>
      _isLightTheme ? AppColors.greyLight : AppColors.neutral;
}
