import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppTextStyles {
  AppTextStyles._();
  // Global Styles //
  // ---- app button styles
  static TextStyle appFillColorButtonTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle appEmptyFillColorButtonTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkModeTanOrange,
      );
  // ---- onboarding&signup&login => head title
  static TextStyle headTitle24w600TextStyle(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: context.isDarkTheme ? AppColors.white : AppColors.darkBlue,
      );
  static TextStyle smallHeadTitle22w400TextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme ? AppColors.white : AppColors.darkBlue,
      );

  static TextStyle meduimHead16w500TitleTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme ? AppColors.white : AppColors.darkBlue,
      );
  // ---- onboarding&signup&login => body title
  static TextStyle bodyTitle18w400TextStyle(BuildContext context) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.lightPeriwinkle,
      );

  static TextStyle meduimBody16W500TitleTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle.withOpacity(.8),
      );

  static TextStyle smallBodyTitle12w400TextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
      );
  static TextStyle smallBodyTitle12w400WithContrastColorTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppWidgetColor.fillWithContrastColor(context),
      );

  // onBoarding
  static TextStyle skipButton18w400TextStyle(BuildContext context) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.orangeTanHide
            : AppColors.periwinkle,
      );

  // signup
  // ---- Text Field HeadTitle
  static TextStyle textFieldHintText16w500Style(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
      );

  // navigation text
  static TextStyle navigationTextUnderlineTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.orangeTanHide,
    decoration: TextDecoration.underline,
    // ignore: deprecated_member_use
    decorationColor: AppColors.darkModeTanOrange.withOpacity(0.6),
  );
  static TextStyle deActiveNavigationUnderlineTextTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
        decoration: TextDecoration.underline,
        // ignore: deprecated_member_use
        decorationColor: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
      );

  static TextStyle navigationTextTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.orangeTanHide,
  );

  static TextStyle questionTextTextStyle(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
      );

  static TextStyle numbersTextStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.lightPeriwinkle,
      );

  static TextStyle appBarHeadTitleTextStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      );

  static TextStyle errorTextTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.errorRed,
  );

  static TextStyle hintTextLightMoreDarkPeriwinkleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.moreLighterDarkPeriwinkle,
  );

  static TextStyle multiSelectChoiseDecorationTextStyle(
          {required BuildContext context, required bool isSelectd}) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isSelectd
            ? AppColors.primary
            : context.isLightTheme
                ? AppColors.secondDarkBlue
                : AppColors.white,
      );
}
