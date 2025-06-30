import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/features/home/view/screens/home_screen.dart';

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
<<<<<<< HEAD
          LocaleKeys.complete_profile_sucsses_complet_sucsses_profile.tr(),
=======
          LocaleKeys.complete_profile_profile_complete_succesed.tr(),
>>>>>>> 4f059abfa36b0b1d29ce43a361c5ae61a11c5565
          style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(10),
        AppFillBckgroundButton(
            onTap: () {
              pushReplacement(context, HomeScreen());
            },
<<<<<<< HEAD
            title: LocaleKeys
                .complete_profile_sucsses_complet_start_your_journey
                .tr())
=======
            title: LocaleKeys.on_boarding_get_started.tr())
>>>>>>> 4f059abfa36b0b1d29ce43a361c5ae61a11c5565
      ],
    );
  }
}
