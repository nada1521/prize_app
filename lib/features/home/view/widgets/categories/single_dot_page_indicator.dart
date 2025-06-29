import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class SingleDotPageIndicator extends StatelessWidget {
  final PageController controller;
  final int pageCount;

  const SingleDotPageIndicator({
    super.key,
    required this.controller,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double page = controller.hasClients ? controller.page ?? 0.0 : 0.0;

        double progress = (page % 1);

        return Container(
          width: 40,
          height: 8,
          decoration: BoxDecoration(
            color: AppWidgetColor.outlineWidgetColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 1 / pageCount,
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
