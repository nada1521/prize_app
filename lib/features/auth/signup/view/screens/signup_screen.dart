import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/auth/otp/view/screens/otp_screen.dart';
import 'package:prize/features/auth/signup/view/widgets/already_have_account_text.dart';

import 'package:prize/features/auth/signup/view/widgets/signup_form_field_widget.dart';
import 'package:prize/features/auth/signup/view/widgets/terms_and_conditions_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  LocaleKeys.auth_label_sign_up.tr(),
                  style: AppTextStyles.headTitle24w600TextStyle(context),
                ),
                verticalSpace(10),
                Text(
                  LocaleKeys.auth_title_signup_hint.tr(),
                  style: AppTextStyles.bodyTitle18w400TextStyle(context),
                ),
                verticalSpace(40),
                SignUpFormFieldWidget(
                  formKey: formKey,
                  nameController: nameController,
                  phoneController: phoneController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                verticalSpace(20),
                TermsAndConditionsText(),
                verticalSpace(20),
                AppSubmitButton(
                  onTap: () {
                    // if (formKey.currentState!.validate()) {
                    AppNavigator.pushSlideX(
                      context,
                      const OtpScreen(
                        isRecoverPassword: false,
                      ),
                    );

                    // }
                  },
                  title: LocaleKeys.auth_label_sign_up.tr(),
                  height: 46.h,
                  width: double.infinity,
                ),
                verticalSpace(15),
                Align(
                    alignment: Alignment.center,
                    child: AlreadyHaveAccountText()),
                verticalSpace(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
