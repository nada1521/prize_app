import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prize/core/utils/constants.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/app_fill_background_button.dart';
import 'package:prize/core/widgets/orange_appbar_widget.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmNewPasswordController =
        TextEditingController();

    final List<TextFieldModel> textFieldModels = [
      TextFieldModel(
        isPassword: true,
        title: LocaleKeys.setting_screen_change_password_change_password.tr(),
        hintText:
            LocaleKeys.setting_screen_change_password_current_password.tr(),
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: currentPasswordController,
      ),
      TextFieldModel(
        isPassword: true,
        title: LocaleKeys.setting_screen_change_password_new_password.tr(),
        hintText:
            LocaleKeys.setting_screen_change_password_hint_new_password.tr(),
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: newPasswordController,
      ),
      TextFieldModel(
        isPassword: true,
        title:
            LocaleKeys.setting_screen_change_password_confirm_new_password.tr(),
        hintText: LocaleKeys
            .setting_screen_change_password_hint_confirm_password
            .tr(),
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: confirmNewPasswordController,
      ),
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: LocaleKeys.setting_screen_change_password_change_password.tr(),
        showBackButton: true,
      ),
      body: Padding(
        padding: screensPadding,
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
      bottomNavigationBar: Padding(
        padding: screensPadding,
        child: AppFillBckgroundButton(
          onTap: () {},
          title: LocaleKeys.setting_screen_change_password_change.tr(),
        ),
      ),
    );
  }
}
