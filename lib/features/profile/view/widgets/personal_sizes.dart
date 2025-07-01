import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class PersonalSizes extends StatelessWidget {
  const PersonalSizes({super.key});

  final List<String> sizes = const [
    "shoes size : 30",
    "Pants size: 40",
    "Favourite color : blue",
    "T-shirt size: XL",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 5.h,
      children: sizes.map((text) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppWidgetColor.fillWidgetByLightBackgroundColor(context)
                .withOpacity(.25),
            borderRadius: BorderRadius.circular(12.r),
            border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
