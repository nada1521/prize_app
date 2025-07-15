import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppDivderWidget extends StatelessWidget {
  const AppDivderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.2,
      width: 200.w,
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppWidgetColor.outlineWidgetColor,
      ),
    );
  }
}
