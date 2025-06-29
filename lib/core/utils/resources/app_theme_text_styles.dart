import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

extension AppTextTheme on TextTheme {
  TextStyle font16Medium(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      );

  TextStyle font17Regular(BuildContext context) => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      );

  TextStyle font18RegularDarkBlue(BuildContext context) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onPrimary,
      );

  TextStyle font20SemiBoldDarkBlue(BuildContext context) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle font16MediumWhite(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );

  TextStyle font16DarkBlue(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      );
  TextStyle appBarHeadTitlefont20DarkBlue(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle font16RegularDarkPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.tertiary,
      );
  TextStyle font15LightMoreDarkPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.moreDarkPeriwinkle
            : Theme.of(context).colorScheme.tertiary,
      );
  TextStyle font14RegularDarkPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle font16BoldDarkPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle font14RegularPrimary(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.primary,
      );
  TextStyle font14RegularOrange(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onPrimary,
      );

  TextStyle font12RegularDarkPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle font12SemiBoldGray(BuildContext context) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.tertiary,
      );

  TextStyle font12MeduimOnPrimaryUnderline(BuildContext context) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onPrimary,
        decoration: TextDecoration.underline,
        decorationColor:
            Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
      );

  TextStyle font14MeduimPeriwinkle(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.tertiary,
      );
  TextStyle font14MeduimUploadImage(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.neutralColor
            : Theme.of(context).colorScheme.tertiary,
      );

  TextStyle font14RegularUploadImageOrange(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimary,
      );

  TextStyle font24SemiBoldDarkBlue(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
      );
  TextStyle font24MeduimDarkBlue(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle font16RegularDarkBlue(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle font24RegularDarkBlue(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary,
      );

  TextStyle font13RegularError(BuildContext context) => TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.error,
      );

  TextStyle font14RegularClay(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        // color: Theme.of(context).colorScheme.onSurface,
      );

  TextStyle mediumFontStyle(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      );

  TextStyle semiBoldFontStyle(BuildContext context) => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // add items text styles

  TextStyle offerTextStyle(BuildContext context) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSecondary,
      );
}
