import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_replacement.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/auth/signup/view/screens/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipeButton extends StatelessWidget {
  const SkipeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 24.w),
      child: GestureDetector(
        onTap: () async {
          // Navigation To SignupScreen
          pushToSignupScreen(context);
          tologFirstTimeChecker(isFirstTime: false);
        },
        child: Text(
          LocaleKeys.on_boarding_skip.tr(),
          style: AppTextStyles.skipButton18w400TextStyle(context),
        ),
      ),
    );
  }

  void pushToSignupScreen(BuildContext context) async {
    await pushReplacement(
      context,
      SignupScreen(),
    );
  }
}
