import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/home/data/models/coming_event_model.dart';

class ComingEventWidget extends StatelessWidget {
  const ComingEventWidget({super.key, required this.event});

  final ComingEventModel event;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppWidgetColor.fillWidgetByLightBackgroundColor(context),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgs.calendar, height: 32.h),
          horizontalSpace(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(5),
              Text(
                DateFormat('d MMM yyyy').format(event.date),
                style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                    .copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              spacing: 5.w,
              children: [
                SvgPicture.asset(
                  AppSvgs.clock,
                  width: 14.w,
                  height: 14.h,
                ),
                Text(
                  '7 days',
                  style: AppTextStyles.smallBodyTitle12w400TextStyle(context)
                      .copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.errorRed,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
