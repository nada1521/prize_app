import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class BottomSheetDotedBorderWidget extends StatelessWidget {
  const BottomSheetDotedBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32.w,
          height: 5.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.r),
            color: AppWidgetColor.dotedFillColor(context),
          ),
        )
      ],
    );
  }
}
