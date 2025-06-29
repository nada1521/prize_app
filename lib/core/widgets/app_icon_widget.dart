import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget(
      {super.key, required this.svgIconPath, required this.onTap});

  final String svgIconPath;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppWidgetColor.fillIconButtonWidgetColor(context),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                svgIconPath,
                // ignore: deprecated_member_use
                color: AppWidgetColor.iconColor(context),
              ),
            ),
          )),
    );
  }
}
