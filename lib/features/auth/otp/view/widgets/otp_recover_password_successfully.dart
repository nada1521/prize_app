import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/features/auth/login/view/screens/login_screen.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpRecoverPasswordSuccessfullyWidget extends StatelessWidget {
  const OtpRecoverPasswordSuccessfullyWidget({super.key});

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
          style: Theme.of(context).textTheme.font24SemiBoldDarkBlue(context),
        ),
        verticalSpace(8),
        Text(
          LocaleKeys.auth_otp_registered_successfully_dialog_body.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .font14RegularDarkPeriwinkle(context)
              .copyWith(
                letterSpacing: 0.5,
              ),
        ),
        verticalSpace(10),
        AppSubmitButton(
          title: LocaleKeys.auth_label_login.tr(),
          onTap: () {
            // Navigation To LoginScreen
                        Navigator.pop(context);
            pushReplacement(context, LoginScreen());

          },
          width: double.infinity,
        )
      ],
    );
  }
}
