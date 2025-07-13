import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, this.textColor});

  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Abdelrahman Ali",
          style: textColor != null
              ? AppTextStyles.meduimBody16W500BlackAndWhiteTitleTextStyle(
                  context)
              : AppTextStyles.meduimBody16W500WhiteOnlyTitleTextStyle(context),
        ),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            InfoNumberWidget(
              number: '14',
              title: LocaleKeys.profile_screen_user_info_wishlist.tr(),
              textColor: textColor,
            ),
            InfoNumberWidget(
              number: '20',
              title: LocaleKeys.profile_screen_user_info_followers.tr(),
              textColor: textColor,
            ),
            InfoNumberWidget(
              number: '310',
              title: LocaleKeys.profile_screen_user_info_following.tr(),
              textColor: textColor,
            ),
          ],
        )
      ],
    );
  }
}

class InfoNumberWidget extends StatelessWidget {
  const InfoNumberWidget(
      {super.key, required this.number, required this.title, this.textColor});

  final String number;
  final String title;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    final double boxWidth = (MediaQuery.of(context).size.width - 48.w) / 3;

    return SizedBox(
      width: boxWidth.clamp(20.w, 65.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
              color: textColor ?? AppColors.white,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(context)
                .copyWith(
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
