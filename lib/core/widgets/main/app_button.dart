import 'package:prize/core/utils/extensions/color_extension.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_circular_progress.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize = 16,
    this.horizontalContentPadding = 16,
    this.verticalContentPadding = 16,
    this.fit = true,
    this.outlined = false,
    this.loading = false,
    this.strokeAlign = BorderSide.strokeAlignInside,
    this.color,
    this.onColor,
    this.stadiumBorder = false,
    this.icon,
  });

  final void Function()? onPressed;
  final String title;
  final double fontSize;
  final bool fit;
  final bool outlined;
  final bool loading;
  final double strokeAlign;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final Color? color;
  final Color? onColor;
  final bool stadiumBorder;
  final Widget? icon;

  bool get _activated => onPressed != null;

  Color getColor(BuildContext context) {
    if (context.isLightTheme) {
      return _activated ? color ?? AppColors.primary : AppColors.overlay;
    } else {
      return _activated ? color ?? context.colorPrimary : AppColors.greyDarker;
    }
  }

  @override
  Widget build(BuildContext context) {
    final clr = getColor(context);
    return MaterialButton(
      onPressed: loading ? null : onPressed,
      padding: EdgeInsets.zero,
      shape: stadiumBorder
          ? const StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
      highlightElevation: 5,
      child: Ink(
        decoration: BoxDecoration(
          color: outlined ? null : clr,
          borderRadius: BorderRadius.circular(stadiumBorder ? 100 : 14),
          border: outlined
              ? Border.all(
                  color: clr,
                  width: 2,
                  strokeAlign: strokeAlign,
                )
              : null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalContentPadding - (outlined ? 2.2 : 0),
            vertical: verticalContentPadding - (outlined ? 2.2 : 0),
          ),
          width: fit ? double.maxFinite : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null || loading)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6),
                  child: loading
                      ? Center(
                          child: AppCircularProgress(
                            color:
                                outlined ? clr : (onColor ?? AppColors.white),
                            size: 20,
                            strokeWidth: 2.7,
                          ),
                        )
                      : icon!,
                ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: outlined ? clr : (onColor ?? AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
