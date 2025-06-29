import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_theme_text_styles.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/core/widgets/app_back_button.dart';
import 'package:prize/features/auth/forget_password/view/widgets/remember_your_password_widget.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/auth/otp/data/enums/select_otp_enums.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/otp/view/screens/otp_screen.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key, required this.otpMethod});

  final OtpMethods otpMethod;
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  late TextFieldModel _textField;

  @override
  void initState() {
    super.initState();

    if (widget.otpMethod == OtpMethods.phoneNumber) {
      _textField = TextFieldModel(
        isPhoneNumber: true,
        controller: phoneController,
        hintText: LocaleKeys.auth_hint_texts_type_your_phone_number.tr(),
        title: LocaleKeys.auth_label_phone_number.tr(),
        validator: (phone) => AppValidation.phoneNumberValidation(
          phone,
          requiredValidation: true,
        ),
      );
    } else {
      _textField = TextFieldModel(
        isPhoneNumber: false,
        controller: emailController,
        hintText: LocaleKeys.auth_placeholder_enter_your_email.tr(),
        title: LocaleKeys.auth_label_email.tr(),
        validator: AppValidation.emailValidation,
      );
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              Text(
                LocaleKeys.auth_forget_password_title.tr(),
                style:
                    Theme.of(context).textTheme.font24SemiBoldDarkBlue(context),
              ),
              verticalSpace(10),
              Text(
                LocaleKeys.auth_forget_password_label_male.tr(),
                style: Theme.of(context)
                    .textTheme
                    .font16RegularDarkPeriwinkle(context),
              ),
              verticalSpace(30),
              CustomTextFieldWidget(
                textFieldModel: _textField,
              ),
              verticalSpace(30),
              AppSubmitButton(
                onTap: () {
                  // if (formKey.currentState!.validate()) {
                  AppNavigator.pushSlideX(
                      context,
                      const OtpScreen(
                        isRecoverPassword: true,
                      ));
                  // }
                },
                title: LocaleKeys.auth_forget_password_recover_password.tr(),
                height: 46.h,
                width: double.infinity,
              ),
              verticalSpace(30),
              RememberYourPasswordWidget()
            ],
          ),
        ),
      ),
    );
  }
}
