import 'package:flutter/material.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppTextStyles {
  AppTextStyles._();
  // Global Styles //
  // ---- app button styles
  static TextStyle appFillColorButton16w500TextStyle(BuildContext context) =>
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
  static TextStyle headTitle14w500WhiteAndDarkBlueTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme ? AppColors.white : AppColors.darkBlue,
      );
  static TextStyle headTitle14w400GreenTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greenColor,
      );
  static TextStyle smallHeadTitle12w400TextStyle(BuildContext context) =>
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
            : AppColors.moreLightPeriwinkle,
      );
  static TextStyle bodyTitle18w400darkPeriwinkleTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreDarkPeriwinkle,
      );

  static TextStyle meduimBody16W500DarkAndLightThemeTitleTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle.withOpacity(.8),
      );
  static TextStyle meduimBody16W500WhiteOnlyTitleTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );

  static TextStyle meduimBody16W500BlackAndWhiteTitleTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.secondDarkBlue,
      );
  static TextStyle meduimBody16W600BlackAndWhiteTitleTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: context.isDarkTheme ? AppColors.white : AppColors.darkBlue,
      );

  static TextStyle smallBodyTitle12w400TextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle,
      );
  static TextStyle smallBodyTitle12w500TextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle,
      );
  static TextStyle smallBodyTitle12w400WithContrastColorTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppWidgetColor.fillWithOppositeColor(context),
      );
  static TextStyle smallBodyTitle12w500WhiteOnlyTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      );
  static TextStyle smallBodyTitle12w500BlackAndWhiteOnlyTextStyle(
          BuildContext context) =>
      TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color:
            context.isDarkTheme ? AppColors.primaryWhite : AppColors.darkBlue,
      );

  // onBoarding
  static TextStyle skipButton18w400TextStyle(BuildContext context) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.orangeTanHide
            : AppColors.moreLightPeriwinkle,
      );

  // signup
  // ---- Text Field HeadTitle
  static TextStyle textFieldHintText16w500Style(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle,
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
            : AppColors.moreLightPeriwinkle,
        decoration: TextDecoration.underline,
        // ignore: deprecated_member_use
        decorationColor: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle,
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
            : AppColors.moreLightPeriwinkle,
      );

  static TextStyle numbersTextStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.moreLightPeriwinkle,
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

  //  chekOut screen
  static TextStyle bodyTitle14w500PeriwinkleTextStyle(BuildContext context) =>
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: context.isDarkTheme
            ? AppColors.darkPeriwinkle
            : AppColors.periwinkle,
      );
}
