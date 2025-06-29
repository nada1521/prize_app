// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/extensions/is_dark_mode_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class AppWidgetColor {
  AppWidgetColor._();

  // for primry widget
  static Color backgroundColor(BuildContext context) => context.isDarkMode
      ? AppColors.primaryDarkMode
      : AppColors.lightModeBackground;
  // dots and page indicator color
  static Color indicatorColor = AppColors.tanOrange;
  static Color fillWidgetColor(BuildContext context) => context.isDarkMode
      ? AppColors.fillwidgetSecondDarkBlue
      : AppColors.primaryWhite;
  static Color fillWidgetWithOrangeAndDarkColor(BuildContext context) =>
      context.isDarkMode
          ? AppColors.fillwidgetSecondDarkBlue
          : AppColors.primary;
  static Color secondFillWidgetColor(BuildContext context) =>
      context.isDarkMode ? AppColors.primaryDarkMode : AppColors.lightModeGray;
  static Color fillIconWidgetColor(BuildContext context) =>
      context.isDarkMode ? AppColors.darkModeGray : AppColors.white;
  static Color fillIconButtonWidgetColor(BuildContext context) =>
      context.isDarkMode ? AppColors.darkModeGray : AppColors.lightModeGray;

  static Color fillWidgetByLightBackgroundColor(BuildContext context) =>
      context.isDarkMode ? AppColors.darkModeBackground : AppColors.white;

  static Color fillWithContrastColor(BuildContext context) =>
      context.isDarkMode ? AppColors.white : AppColors.secondperiwinkle;

  static Color fillWithGrayAndDiColor(BuildContext context) =>
      context.isDarkMode ? AppColors.darkBlue : AppColors.secondperiwinkle;

  // text field
  static Color outlineWidgetColor = AppColors.lightModeGray.withOpacity(.5);

  static Color fillBackgroundColor(BuildContext context) =>
      context.isDarkMode ? AppColors.darkModeBackground : AppColors.white;

  static Color underlineTextColor(BuildContext context) => context.isDarkMode
      ? AppColors.darkModeTanOrange
      : AppColors.lightModeTanOrange;

  static Color iconColor(BuildContext context) =>
      context.isDarkMode ? AppColors.white : AppColors.darkBlue;
  static Decoration multiSelectChoiseDecoration(
          BuildContext context, bool isSelected) =>
      BoxDecoration(
        color: isSelected
            ? context.isLightTheme
                ? AppColors.primary.withOpacity(.15)
                : AppColors.white
            : fillBackgroundColor(context),
        border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
        borderRadius: BorderRadius.circular(12.r),
      );
}

class GlobalAppWidgetsStyles {
  GlobalAppWidgetsStyles._();

  static InputBorder appFocusedBorder(BuildContext context) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: context.isDarkMode
              ? AppColors.darkModeTanOrange
              : AppColors.lightModeTanOrange,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static InputBorder appEnabledBorder(BuildContext context) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: AppWidgetColor.outlineWidgetColor.withOpacity(.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static InputBorder appErrorBorder(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.errorRed,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      );

  static BoxBorder containerGrayBoxBorder(BuildContext context) => Border.all(
      color: AppWidgetColor.outlineWidgetColor.withOpacity(.4), width: 1);
  static BoxBorder containerOrangeBoxBorder(BuildContext context) =>
      Border.all(color: AppColors.darkModeTanOrange, width: 1);

  static BoxDecoration appFocusedBoxDecoration(BuildContext context) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.isDarkMode
              ? AppColors.darkModeTanOrange
              : AppColors.lightModeTanOrange,
          width: 1,
        ),
      );

  static BoxDecoration appCircleBoxDecoration(BuildContext context) =>
      BoxDecoration(
          shape: BoxShape.circle,
          color: AppWidgetColor.fillBackgroundColor(context),
          border: Border.all(
              color: AppWidgetColor.fillWidgetColor(context), width: 1));

  static PinTheme defaultPinTheme(BuildContext context) => PinTheme(
        width: 64,
        height: 64,
        textStyle: AppTextStyles.smallBodyTitle12w400TextStyle(context),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: containerGrayBoxBorder(context),
        ),
      );
}
