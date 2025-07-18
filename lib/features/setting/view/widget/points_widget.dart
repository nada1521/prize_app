import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/point/view/screen/point_screen.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushTo(context, PointScreen()),
      child: Container(
        height: 95.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [
              AppColors.blueColor,
              AppColors.blueColor.withOpacity(.4),
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 72.w,
              height: 62.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: SvgPicture.asset(
                  AppSvgs.pointsIcon,
                  width: 26.w,
                  height: 26.h,
                ),
              ),
            ),
            horizontalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.setting_screen_points.tr(),
                  style: AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(
                      context),
                ),
                Text(
                  "200",
                  style:
                      AppTextStyles.headTitle24w600TextStyle(context).copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
