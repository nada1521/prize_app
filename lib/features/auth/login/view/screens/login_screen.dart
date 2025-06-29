import 'package:prize/core/routing/app_router.dart';
import 'package:prize/core/routing/routers.dart';
import 'package:prize/core/utils/extensions/navigation_extension.dart';
import 'package:prize/core/utils/generated/tr_locale_keys.g.dart';
import 'package:prize/core/utils/helper/navigation/push_to.dart';
import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/utils/validation/app_validation.dart';
import 'package:prize/features/auth/login/view/widgets/dont_have_account.dart';
import 'package:prize/features/auth/login/view/widgets/forget_password_widget.dart';
import 'package:prize/features/auth/login/view/widgets/login_form_field.dart';
import 'package:prize/features/home/view/bottom_navbar/bottom_navbar.dart';
import 'package:prize/features/onboarding/view/widgets/app_submit_button.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    List<TextFieldModel> textFieldModels = [
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
        isPassword: true,
        controller: passwordController,
        hintText: LocaleKeys.auth_label_password.tr(),
        title: LocaleKeys.auth_label_password.tr(),
        validator: AppValidation.passwordValidation,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(30),
                  Text(
                    LocaleKeys.auth_label_login.tr(),
                    style: AppTextStyles.headTitle24w600TextStyle(context),
                  ),
                  verticalSpace(10),
                  Text(
                    LocaleKeys.auth_title_login_hint.tr(),
                    style:
                        AppTextStyles.meduimBody16W500TitleTextStyle(context),
                  ),
                  verticalSpace(40),
                  LoginFormField(textFieldModels: textFieldModels),
                  verticalSpace(10),
                  const ForgetPasswordWidget(),
                  verticalSpace(40),
                  AppSubmitButton(
                    onTap: () {
                      // if (formKey.currentState!.validate()) {
                      // AppNavigator.pushSlideX(
                      //   context,
                      //   BottomNavBar(),
                      // );

                      context.pushNamed(AppRoutes.bottomNavBar);

                      // }
                    },
                    title: LocaleKeys.auth_label_login.tr(),
                    height: 46.h,
                    width: double.infinity,
                  ),
                  verticalSpace(15),
                  const Align(
                    alignment: Alignment.center,
                    child: DontHaveAccount(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
