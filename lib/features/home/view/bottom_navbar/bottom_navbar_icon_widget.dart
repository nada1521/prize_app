import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class BottomNavbarIconWidget extends StatelessWidget {
 const BottomNavbarIconWidget(
      {super.key,
      required this.iconPath,
      required this.cuttentIndex,
      required this.selectedIndex,
      this.iconColor});

  final String iconPath;
  final int cuttentIndex;
  final int selectedIndex;
 final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: SvgPicture.asset(
        iconPath,
        color: cuttentIndex == selectedIndex
            ? iconColor ?? AppColors.primary.withOpacity(.8)
            : iconColor ?? AppColors.moreLighterDarkPeriwinkle,
        width: 30.w,
      ),
    );
  }
}
