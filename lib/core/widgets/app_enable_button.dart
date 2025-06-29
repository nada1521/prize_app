import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class AppFillBckgroundButton extends StatelessWidget {
  final String title;
  final double? width, height;
  final Function() onTap;
  final Color? startColor;
  final Color? endColor;

  const AppFillBckgroundButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.startColor,
    this.endColor,
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
          borderRadius: BorderRadius.circular(16.r),
          gradient: gradient,
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                title,
                style: AppTextStyles.appFillColorButtonTextStyle(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
