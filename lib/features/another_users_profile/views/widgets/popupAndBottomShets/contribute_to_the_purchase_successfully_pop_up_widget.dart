import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/constant/app_images.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/resources/app_widget_color.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';

class ContributeToThePurchaseSuccessfullyPopUpWidget extends StatelessWidget {
  const ContributeToThePurchaseSuccessfullyPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 450.h,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: 32.w,
            height: 5.h,
            color: AppWidgetColor.dotedFillColor(context),
          ),
          verticalSpace(10),
          Image.asset(
            AppImages.successImage,
            width: 120.w,
            height: 120.h,
          ),
          verticalSpace(10),
          Text(
            LocaleKeys.payment_screen_contribution_successfully.tr(),
            style: AppTextStyles.headTitle24w600TextStyle(context),
          ),
          verticalSpace(8),
          Text(
            LocaleKeys.payment_screen_Consider_inviting_athers.tr(),
            style: AppTextStyles.bodyTitle16w400PeriwinkleTextStyle(context),
          ),
          verticalSpace(20),
          CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              title: LocaleKeys.payment_screen_share_link.tr(),
              hintText: "https://example.com/gift-12432094u9",
              validator: (c) {
                return null;
              },
              controller: TextEditingController(),
            ),
          ),
          verticalSpace(9),
          AppSubmitButton(
              onTap: () {
                context.pop();
              },
              title: LocaleKeys.payment_screen_done.tr()),
        ],
      ),
    );
  }
}
