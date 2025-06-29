import 'package:prize/core/utils/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OtpMethodCard extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final String icon;
  final String text;
  final TextStyle textStyle;

  const OtpMethodCard({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: borderColor, width: 1.w),
        ),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            verticalSpace(8),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
