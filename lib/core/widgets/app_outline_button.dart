import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppOutLineButton extends StatelessWidget {
  final String title;
  final double? width, height;
  final Function() onTap;
  final Widget? icon;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? style;
  const AppOutLineButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.icon,
    this.color,
    this.border,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 46.h,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(16.r),
          border: border ?? GlobalAppWidgetsStyles.containerOrangeBoxBorder(context),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  icon ?? SizedBox.shrink(),
                  horizontalSpace(5),
                  Text(
                    title,
                    style:
                       style ?? AppTextStyles.appEmptyFillColorButtonTextStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
