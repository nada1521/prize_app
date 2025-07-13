import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_circular_icon_button.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';

class ChatWithUsLandingScreen extends StatelessWidget {
  const ChatWithUsLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(231.h),
        child: Container(
          constraints: BoxConstraints(maxHeight: 231.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          color: AppColors.regentBlue,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      // Back button (optional)
                      AppCircularIconButton(
                        iconPath: AppSvgs.arrowLeft,
                        onTap: () => Navigator.of(context).maybePop(),
                      ),
                      horizontalSpace(10),

                      // Title (centered with Expanded)
                      Row(
                        children: [
                          Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.prizeIcon,
                                ),
                              ),
                              color: AppColors.white,
                            ),
                          ),
                          horizontalSpace(10),
                          Text(
                            "Welcome to \nprize Customer service",
                            style:
                                AppTextStyles.headTitle24w600TextStyle(context)
                                    .copyWith(
                              fontSize: 14,
                              color: AppColors.primaryWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(40),
                Text(
                  "We are here for your help , send a message , tell us about your concerns and we will reply in few seconds",
                  style: AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(
                          context)
                      .copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
