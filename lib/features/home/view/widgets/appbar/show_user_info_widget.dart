import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/extensions/context_extension.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class ShowUserInfoWidget extends StatelessWidget {
  const ShowUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
              border: GlobalAppWidgetsStyles.containerGrayBoxBorder(context),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AppImages.userAvatar))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abdelrahman',
              style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                  .copyWith(
                color: AppColors.primaryWhite,
              ),
            ),
            Row(
              spacing: 7.w,
              children: [
                SvgPicture.asset(
                  AppSvgs.location,
                  width: 16.w,
                  height: 16.h,
                ),
                Text(
                  'Mansoura, Egypt',
                  style: AppTextStyles.meduimBody16W500TitleTextStyle(context)
                      .copyWith(
                    fontSize: 12,
                    color: context.isDarkTheme
                        ? AppColors.periwinkle.withOpacity(.8)
                        : AppColors.primaryWhite,
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(AppSvgs.arrowDown),
                )
              ],
            ),
          ],
        ),
        Spacer(),
        InkWell(
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppWidgetColor.fillWidgetByLightBackgroundColor(context)
                  .withOpacity(.25),
            ),
            child: Center(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    AppSvgs.notificationBing,
                    // fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryWhite, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
