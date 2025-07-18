import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class AppFillBckgroundButton extends StatelessWidget {
  final String title;
  final double? width, height;
  final Function() onTap;
  final Color? startColor;
  final Color? endColor;
  final Color? color;
  final Widget? icon;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;

  const AppFillBckgroundButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.startColor,
    this.color,
    this.endColor,
    this.icon,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Set the gradient colors to the passed values, or default to the original ones
    final Gradient gradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        startColor ?? AppColors.primary,
        endColor ?? AppColors.primary,
      ],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 46.h,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          gradient: gradient,
          color: color ?? AppColors.darkModeTanOrange,
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  icon ?? SizedBox.shrink(),
                  horizontalSpace(5),
                  Text(title,
                      style: textStyle ??
                          AppTextStyles.appFillColorButton16w500TextStyle(
                              context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
