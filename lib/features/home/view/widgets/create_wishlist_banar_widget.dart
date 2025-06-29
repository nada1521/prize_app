import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/widgets/app_enable_button.dart';

class CreateWishlistBanarWidget extends StatelessWidget {
  const CreateWishlistBanarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 140.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.primary.withOpacity(.3),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0.h,
              right: 0.w,
              child: SvgPicture.asset(AppSvgs.shapeVector)),
          Positioned(
            top: 40.h,
            right: 40.w,
            child: Image.asset(
              AppImages.happyEmoje,
            ),
          ),
          Positioned(
            left: 20.w,
            top: 15.h,
            child: SizedBox(
              width: 200.w,
              height: 150.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 150.w,
                    ),
                    child: Text(
                      LocaleKeys.home_wishist_banar_title.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.browen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  verticalSpace(5),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 160.w,
                      ),
                      child: AppFillBckgroundButton(
                          onTap: () {}, title: LocaleKeys.home_wishist_banar_button_title.tr()),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
