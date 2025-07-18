import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class CustomItemContainerPoint extends StatelessWidget {
  const CustomItemContainerPoint({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        margin: EdgeInsets.only(bottom: 14.h),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children));
  }
}
