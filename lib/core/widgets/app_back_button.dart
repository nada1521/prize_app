import 'package:prize/core/constant/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppWidgetColor.fillIconWidgetColor(context),
              border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                AppSvgs.arrowLeft,
                // ignore: deprecated_member_use
                color: AppWidgetColor.iconColor(context),
              ),
            ),
          )),
    );
  }
}
