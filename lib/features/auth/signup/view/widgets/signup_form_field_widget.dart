import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpFormFieldWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpFormFieldWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    List<TextFieldModel> textFieldModels = [
      TextFieldModel(
        controller: nameController,
        validator: AppValidation.fullNameValidation,
        title: LocaleKeys.auth_label_name.tr(),
        hintText: LocaleKeys.auth_placeholder_type_your_name.tr(),
      ),
      TextFieldModel(
        isPhoneNumber: true,
        controller: phoneController,
        hintText: LocaleKeys.auth_hint_texts_type_your_phone_number.tr(),
        title: LocaleKeys.auth_label_phone_number.tr(),
        validator: (phone) => AppValidation.phoneNumberValidation(
          phone,
          requiredValidation: true,
        ),
      ),
      TextFieldModel(
        controller: emailController,
        hintText: LocaleKeys.auth_placeholder_enter_your_email.tr(),
        title: LocaleKeys.auth_label_email.tr(),
        validator: AppValidation.emailValidation,
      ),
      TextFieldModel(
        isPassword: true,
        controller: passwordController,
        hintText: LocaleKeys.auth_label_password.tr(),
        title: LocaleKeys.auth_label_password.tr(),
        validator: AppValidation.passwordValidation,
      ),
    ];

    return Form(
      key: formKey,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: textFieldModels.length,
        itemBuilder: (context, index) => CustomTextFieldWidget(
          textFieldModel: textFieldModels[index],
        ),
        separatorBuilder: (context, index) => verticalSpace(16),
      ),
    );
  }
}
