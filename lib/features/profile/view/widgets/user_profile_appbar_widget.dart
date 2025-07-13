import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/setting/view/screens/setting_screen.dart';

class UserProfileAppbarWidget extends StatelessWidget {
  const UserProfileAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 85.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppWidgetColor.fillBackgroundColor(context),
            borderRadius: BorderRadius.circular(48.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppSvgs.pointsIcon,
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpace(3),
                  Text(
                    "200",
                    style: AppTextStyles.headTitle24w600TextStyle(context)
                        .copyWith(
                      color: AppColors.darkModeTanOrange,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        AppCircularIconButton(
          iconPath: AppSvgs.settingIcon,
          onTap: () {
            pushTo(context, SettingScreen());
          },
        ),
      ],
    );
  }
}
