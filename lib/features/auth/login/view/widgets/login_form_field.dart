import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:prize/features/auth/signup/view/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  final List<TextFieldModel> textFieldModels;
  const LoginFormField({super.key, required this.textFieldModels});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: textFieldModels.length,
      itemBuilder: (context, index) => CustomTextFieldWidget(
        textFieldModel: textFieldModels[index],
      ),
      separatorBuilder: (context, index) => verticalSpace(16),
    );
  }
}
