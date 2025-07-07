import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prize/core/utils/constants.dart';
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
        title: "Current Password",
        hintText: "your current password",
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: currentPasswordController,
      ),
      TextFieldModel(
        isPassword: true,
        title: "New Password",
        hintText: "new password",
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: newPasswordController,
      ),
      TextFieldModel(
        isPassword: true,
        title: "Confirm New Password",
        hintText: "enter new password again",
        validator: (p0) {
          return AppValidation.passwordValidation(p0);
        },
        controller: confirmNewPasswordController,
      ),
    ];
    return Scaffold(
      appBar: OrangeAppbarWidget(
        title: "Change Pssword",
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
          title: "Change",
        ),
      ),
    );
  }
}
