import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';

class ContactUsScreens extends StatelessWidget {
  const ContactUsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    final List<TextFieldModel> textFieldModels = [
      TextFieldModel(
        title: LocaleKeys.setting_screen_contact_us_name.tr(),
        hintText: LocaleKeys.setting_screen_contact_us_enter_your_name.tr(),
        validator: (data) {
          return AppValidation.nameValidation(data);
        },
        controller: nameController,
      ),
      TextFieldModel(
        isPhoneNumber: true,
        title: LocaleKeys.setting_screen_contact_us_phone_number.tr(),
        hintText: "00000000",
        validator: (data) {
          return AppValidation.phoneNumberValidation(data);
        },
        controller: phoneNumberController,
      ),
      TextFieldModel(
        title: LocaleKeys.setting_screen_contact_us_email.tr(),
        hintText: "example@gmail.com",
        validator: (data) {
          return AppValidation.emailValidation(data);
        },
        controller: emailController,
      ),
      TextFieldModel(
        title: LocaleKeys.setting_screen_contact_us_message.tr(),
        hintText: LocaleKeys.setting_screen_contact_us_write_your_message.tr(),
        validator: (data) {
          return AppValidation.contactUsMessageValidation(data!);
        },
        controller: messageController,
        maxLines: 3,
      ),
    ];

    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.setting_screen_contact_us_contact_us.tr(),
        showBackButton: true,
      ),
      body: Padding(
        padding: screensPadding,
        child: ListView(
          children: [
            Text(
              LocaleKeys.setting_screen_contact_us_haveing_a_problem.tr(),
              style: AppTextStyles.headTitle24w600TextStyle(context).copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              LocaleKeys.setting_screen_contact_us_problems_in_our_application
                  .tr(),
              style:
                  AppTextStyles.bodyTitle18w400darkPeriwinkleTextStyle(context)
                      .copyWith(
                fontSize: 14,
              ),
            ),
            verticalSpace(40),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: textFieldModels.length,
                itemBuilder: (context, index) => CustomTextFieldWidget(
                  textFieldModel: textFieldModels[index],
                ),
                separatorBuilder: (context, index) => verticalSpace(16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: screensPadding,
        child: AppFillBckgroundButton(
          onTap: () {},
          title: LocaleKeys.setting_screen_contact_us_send.tr(),
        ),
      ),
    );
  }
}
