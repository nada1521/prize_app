import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

extension TextStyleX on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;
  bool get _isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  // Headline
  TextStyle get styleHeadline1 => _textTheme.headlineLarge!;

  TextStyle get styleHeadline2 => _textTheme.headlineMedium!;

  TextStyle get styleHeadline3 => _textTheme.headlineSmall!;

  TextStyle get styleHeadline3Light => _textTheme.headlineSmall!.copyWith(
        color: _isDarkTheme ? null : AppColors.subtitle,
      );

  TextStyle get styleHeadline3Bold => _textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.bold,
      );

  // Title
  TextStyle get styleTitleMedium => _textTheme.titleMedium!;

  TextStyle get styleTitleMediumLight => _textTheme.titleMedium!.copyWith(
        color: _isDarkTheme ? null : AppColors.titleBodyLight,
      );

  TextStyle get styleTitleLarge => _textTheme.titleLarge!;

  TextStyle get styleTitleLargeBold => _textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold,
      );

  // Hint
  TextStyle get styleHintText => TextStyle(
        color: _isDarkTheme ? null : AppColors.titleBodyLight,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );

  // Body
  TextStyle get styleBodyMedium => _textTheme.bodyMedium!.copyWith(
        // fontSize: 14,
        fontWeight: FontWeight.normal,
      );

  TextStyle get styleBodyMediumLight => _textTheme.bodyMedium!.copyWith(
        color: _isDarkTheme ? null : AppColors.titleBodyLight,
      );

  TextStyle get styleBodyLight12 => _textTheme.bodyMedium!.copyWith(
        fontSize: 12,
        color: _isDarkTheme ? null : AppColors.titleBodyLight,
      );

  TextStyle get styleBodyLarge => _textTheme.bodyLarge!;

  TextStyle get styleBodyLargeLight => _textTheme.bodyLarge!.copyWith(
        color: _isDarkTheme ? null : AppColors.titleBodyLight,
        fontWeight: FontWeight.normal,
        height: 1.6,
      );

  TextStyle get styleBodySmall => _textTheme.bodySmall!;

  // Subtitle
  TextStyle get styleSubtitle14 => _textTheme.bodyMedium!.copyWith(
        fontSize: 14,
        color: _isDarkTheme ? null : AppColors.subtitle,
      );

  TextStyle get styleSubtitle16 => _textTheme.bodyMedium!.copyWith(
        fontSize: 16,
        color: _isDarkTheme ? null : AppColors.subtitle,
      );
}
