import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';

class CompleteProfileIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  final int currentPage;
  final int maxReachedPage;

  const CompleteProfileIndicator({
    super.key,
    required this.controller,
    required this.count,
    required this.currentPage,
    required this.maxReachedPage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(count, (index) {
            Color color;
            if (index == currentPage ||index < maxReachedPage ) {
              color = AppColors.activeColor;
            }  else {
              color = AppColors.darkPeriwinkle;
            }
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: width / 3.5,
              height: 6.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.r),
                color: color,
              ),
            );
          }),
        );
      },
    );
  }
}
