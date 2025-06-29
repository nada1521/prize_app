import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/complete_profile/view/screens/complete_profile_screen.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpRegisteredSuccessfullyWidget extends StatelessWidget {
  const OtpRegisteredSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.successImage,
          width: 120.w,
          height: 120.h,
        ),
        verticalSpace(10),
        Text(
          LocaleKeys.auth_otp_registered_successfully_dialog_title.tr(),
          style: AppTextStyles.headTitle24w600TextStyle(context),
        ),
        verticalSpace(8),
        Text(
          LocaleKeys.auth_otp_registered_successfully_dialog_body.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.meduimBody16W500TitleTextStyle(context).copyWith(
            letterSpacing: 0.5,
          ),
        ),
        verticalSpace(10),
        AppSubmitButton(
          onTap: () {
            Navigator.pop(context);
            pushReplacement(context, CompleteProfileScreen());
          },
          title: LocaleKeys.auth_otp_navigate_to_complete_profile_button.tr(),
        ),
      ],
    );
  }
}
