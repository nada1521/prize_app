import 'package:flutter/material.dart';
import 'package:prize/core/utils/validation/app_validation.dart';

import 'app_text_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    this.labelText,
    this.hintText = 'user@gmail.com',
    /// Default validator is [AppValidation.emailValidation]
    this.validator,
    this.autoValidateMode,
    this.iconSpace = false,
    this.icon,
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
      textInputAction: textInputAction,
      icon: icon,
      autofillHints: const [AutofillHints.email],
      labelText: labelText,
      hintText: hintText,
      autoValidateMode: autoValidateMode,
      iconSpace: iconSpace,
      keyboardType: TextInputType.emailAddress,
      errorText: errorText,
      validator: validator ?? AppValidation.emailValidation,
    );
  }
}
