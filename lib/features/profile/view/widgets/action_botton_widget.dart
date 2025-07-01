import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ActionBottonWidget extends StatelessWidget {
  const ActionBottonWidget(
      {super.key, required this.iconPath, required this.title});

  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.r),
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context)
            .withOpacity(.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20.w,
            height: 20.h,
            color: AppWidgetColor.fillBackgroundColor(context),
          ),
          horizontalSpace(5),
          FittedBox(
            child: Text(
              title,
              style: AppTextStyles.appFillColorButton16w500TextStyle(context)
                  .copyWith(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
