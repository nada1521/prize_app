import 'package:flutter/material.dart';
import 'package:prize/core/utils/validation/app_validation.dart';

import 'app_text_field.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    this.icon,
    this.textInputAction,
    this.labelText,
    this.hintText = '*********',
    /// Default validator is [AppValidation.passwordValidation]
    this.validator,
    this.autoValidateMode,
    this.iconSpace = false,
    this.errorText,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool iconSpace;
  final IconData? icon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      icon: icon,
      labelText: labelText,
      hintText: hintText,
      isPassword: true,
      autoValidateMode: autoValidateMode,
      iconSpace: iconSpace,
      keyboardType: TextInputType.visiblePassword,
      errorText: errorText,
      textInputAction: textInputAction,
      validator: validator ?? AppValidation.passwordValidation,
    );
  }
}
