import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppOutlineIconButton extends StatelessWidget {
  final double? width, height;
  final Function() onTap;
  final Widget icon;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? style;
  const AppOutlineIconButton({
    super.key,
    required this.onTap,
    this.width,
    this.height,
    required this.icon,
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
          border: border ??
              GlobalAppWidgetsStyles.containerOrangeBoxBorder(context),
        ),
        child: icon,
      ),
    );
  }
}
