import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/constant/app_svgs.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/features/auth/forget_password/view/screens/forget_password_screen.dart';
import 'package:prize/features/auth/otp/data/enums/select_otp_enums.dart';
import 'package:prize/features/auth/otp/view/widgets/otp_method_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectOtpMethodWidget extends StatelessWidget {
  const SelectOtpMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  LocaleKeys.auth_otp_select_otp_method.tr(),
                  style:
                      Theme.of(context).textTheme.font24MeduimDarkBlue(context),
                ),
                horizontalSpace(20),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(AppImages.closeCircle),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: OtpMethodCard(
                  onTap: () => AppNavigator.pushSlideX(
                      context,
                      ForgetPasswordScreen(
                        otpMethod: OtpMethods.phoneNumber,
                      )),
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(.1),
                  borderColor: const Color(0xFFFFCCAA),
                  icon: AppSvgs.callCalling,
                  text: LocaleKeys.auth_otp_phone_number.tr(),
                  textStyle:
                      Theme.of(context).textTheme.font14RegularPrimary(context),
                ),
              ),
              horizontalSpace(20),
              Expanded(
                child: OtpMethodCard(
                  onTap: () => AppNavigator.pushSlideX(
                      context,
                      ForgetPasswordScreen(
                        otpMethod: OtpMethods.email,
                      )),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  borderColor: const Color(0xFFD6D4FF),
                  icon: AppSvgs.email,
                  text: LocaleKeys.auth_otp_email.tr(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .font14RegularDarkPeriwinkle(context),
                ),
              ),
            ],
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
