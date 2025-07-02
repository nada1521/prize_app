import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/resources/app_colors.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Abdelrahman Ali",
          style: AppTextStyles.meduimBody16W500WhiteOnlyTitleTextStyle(context),
        ),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: [
            InfoNumberWidget(
              number: '14',
              title: LocaleKeys.profile_screen_user_info_wishlist.tr(),
            ),
            InfoNumberWidget(
              number: '20',
              title: LocaleKeys.profile_screen_user_info_followers.tr(),
            ),
            InfoNumberWidget(
              number: '310',
              title: LocaleKeys.profile_screen_user_info_following.tr(),
            ),
          ],
        )
      ],
    );
  }
}

class InfoNumberWidget extends StatelessWidget {
  const InfoNumberWidget(
      {super.key, required this.number, required this.title});

  final String number;
  final String title;
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
              color: AppColors.white,
            ),
          ),
          Text(
            title,
            style:
                AppTextStyles.smallBodyTitle12w500WhiteOnlyTextStyle(context),
          )
        ],
      ),
    );
  }
}
