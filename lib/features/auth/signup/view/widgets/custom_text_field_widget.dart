import 'package:prize/core/utils/helper/spacing.dart';
import 'package:prize/core/utils/resources/app_text_styles.dart';
import 'package:prize/core/widgets/app_text_form_field.dart';
import 'package:prize/features/auth/signup/data/text_field_model.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget(
      {super.key, required this.textFieldModel, this.hitText});

  final TextFieldModel textFieldModel;
  final Widget? hitText;
  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldModel.title,
          style: AppTextStyles.meduimHead16w500TitleTextStyle(context),
        ),
        verticalSpace(8),
        AppTextFormField(
          suffixIcon: widget.textFieldModel.suffixIcon,
          prefixIcon: widget.textFieldModel.prefixIcon,
          hintText: widget.textFieldModel.hintText,
          validator: widget.textFieldModel.validator,
          controller: widget.textFieldModel.controller,
          isObscureText: widget.textFieldModel.isPassword,
          isPhoneNumber: widget.textFieldModel.isPhoneNumber,
          maxLines: widget.textFieldModel.maxLines,
        ),
        verticalSpace(8),
        widget.hitText ?? SizedBox()
      ],
    );
  }
}
