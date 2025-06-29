import 'package:flutter/material.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.complete_profile_create_wishlist_widget_cover.tr(),
          style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        ),
        verticalSpace(10),
        InkWell(
          onTap: () async {},
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: AppWidgetColor.outlineWidgetColor.withOpacity(.3),
              strokeWidth: 2,
              radius: Radius.circular(16.r),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              dashPattern: [5, 5],
            ),
            child: Container(
                width: double.infinity,
                height: 124.h,
                decoration: BoxDecoration(
                  color:
                      AppWidgetColor.fillWidgetByLightBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppWidgetColor.secondFillWidgetColor(context),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: SvgPicture.asset(
                          AppSvgs.documentUpload,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys
                              .complete_profile_create_wishlist_widget_click_to
                              .tr(),
                          style: AppTextStyles.meduimBody16W500TitleTextStyle(
                                  context)
                              .copyWith(
                            fontSize: 14,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          LocaleKeys
                              .complete_profile_create_wishlist_widget_upload_image
                              .tr(),
                          style: AppTextStyles.meduimBody16W500TitleTextStyle(
                                  context)
                              .copyWith(
                            fontSize: 14,
                            color: AppColors.darkModeTanOrange,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
