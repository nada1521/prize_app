import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';

class YourProfileCompletedSuccessfullyPopUpWidget extends StatelessWidget {
  const YourProfileCompletedSuccessfullyPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.successImage,
          width: 120.w,
          height: 120.h,
        ),
        verticalSpace(10),
        Text(
          LocaleKeys.complete_profile_sucsses_complet_sucsses_profile.tr(),
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(10),
        AppFillBckgroundButton(
          onTap: () {
            context.pushReplacementNamed(AppRoutes.bottomNavBar);
          },
          title: LocaleKeys.complete_profile_sucsses_complet_start_your_journey
              .tr(),
        )
      ],
    );
  }
}
